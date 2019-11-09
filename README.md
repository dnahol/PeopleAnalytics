# Rails app w/ graph

### Technologies explored

* **Ruby** ('2.5.1')
* **Ruby on Rails** ('~> 5.1.6.2') — disabled Turbolinks
* **Postgres** ('~> 11.2')
* **ActiveRecord**
* **Slim Template**
* **HighCharts JS** —
  [here's an example][highcharts example]
* **Gon**
* **Faker**

Added by me:
* **LoremFlickr**
* **Materialize Sass**
* **Material Icons**
* **Rails Action View Form Helpers** -including form_for
* **HTML5 Form Validation**

AND:
* Engineering principles:
  * MVC
  * Fat Models, Skinny Controllers
  * Rails Conventions:
    * Keep Accepted calculations in Concern methods
    * 7 types of Controller Actions:
      * Index: List all objects
        HTTP: GET
      * Show: Show one object
        HTTP: GET
      * Edit: Edit one object
        HTTP: GET
      * Update: Save changes to one object
        HTTP: PATCH/PUT
      * New: Enter info for a new object
        HTTP: GET
      * Create: Save new object
        HTTP: POST
      * Delete: Delete one object
        HTTP: DELETE
---
## Models
### Schema Specifics



**Queries for Table and Graph Data**
Kept in mind the MVC principle of fat models and skinny controllers.

Two main instance methods on the Membership model get my table and graph data.
For Table: table
For Graph: sorted_hts_pts

Membership Model `/app/models/membership.rb`
```ruby
class Membership < ApplicationRecord

  belongs_to :house
  belongs_to :banner_person
  has_many :loyalty_points
  has_many :advisements
  has_many :handouts

  def table
    ActiveRecord::Base.connection.execute("
      SELECT COALESCE(l.date, h.date, a.date) AS cdate,
      l.pts AS lpts, h.units AS hunits, a.units AS aunits, a.id AS aid,
      l.date AS ldate, h.date AS hdate, a.date AS adate
      FROM (SELECT * FROM loyalty_points WHERE membership_id = #{self.id}) l
      FULL OUTER JOIN (SELECT * FROM handouts WHERE membership_id = #{self.id}) h
        ON l.date = h.date
      FULL OUTER JOIN (SELECT * FROM advisements WHERE membership_id = #{self.id}) a
        ON COALESCE(l.date, h.date) = a.date
      ORDER BY cdate ASC;
      ")
  end

  def sorted_hts_pts
    handouts = []
    pts = []
    adv = []
    self.table.each{|r|
      if r["hdate"]
        handouts.push( [ r["hdate"], r["hunits"] ] )
      end
      if r["ldate"]
        pts.push( [ r["ldate"], r["lpts"] ] )
      end
    }
    return { 'hts' => handouts, 'pts' => pts }
  end

end
```

**% Accepted**
Accepted is calculated in a Concern
``/app/models/concerns/accepted.rb ``

```ruby
module Accepted
  extend ActiveSupport::Concern

  def self.rates(membership:)
    uniqs = {}
    num = 0.0
    denom = 0.0
    last_a = nil

    membership.table.each do |r, i|
      a = r["aunits"]
      h = r["hunits"]

      unless a == nil
        unless last_a == nil
          uniqs[ last_a[0] ] = num.to_f / denom
          num = 0.0
          denom = 0.0
        end

        last_a = [ r["cdate"], a ]
      end

      unless h == nil or last_a == nil

        if h == last_a[1]
          num += 1
        end

        denom += 1
      end
    end

    unless last_a == nil
      if uniqs[ last_a[0] ] == nil
        uniqs[ last_a[0] ] = num.to_f / denom
      end
    end

    return uniqs
  end

  def self.rate(advisement:)
    all = Accepted.rates(membership: advisement.membership)
    accepted = all[advisement.date.strftime("%F")]
    advisement.accepted = accepted
    return accepted
  end

  def self.col(membership:)
    col = []
    uniqs = Accepted.rates(membership: membership)
    cur_rate = 0.0
    membership.table.each_with_index do |r, i|
      p "rcdate"
      p r["cdate"]
      if uniqs[r["cdate"]]
        cur_rate = uniqs[r["cdate"]]
      end
      col.push( '%.2f' % (100 * cur_rate) )
    end
    return col
  end

end
```

## Views
### BannerPerson Show View
Uses `materialize-sass 1.0.0`, `material_icons`, `gon` and `highcharts-rails`


![Show View Graph](/app/assets/images/show.jpg)

#### BannerPerson Show View - Top (Graph)

![Show View Graph](/app/assets/images/showTop.jpg)


Used this example as a guide:
2018 Dosis Demo for tracking anemia HB levels against
dose of medication

![Graph from Demo](/app/assets/images/demoGraph.jpg)


#### BannerPerson Show View - Bottom (Table)

Toggles between Regular and Enhanced Show View using Google Materialize front end collapsible component
https://materializecss.com/collapsible.html

##### Regular view mode (Default on page load):

![Show View Graph](/app/assets/images/showBottom.jpg)

##### Enhanced view mode:
![Show View Graph](/app/assets/images/showBottomEnhanced.jpg)


#### BannerPerson Edit Advisements
Can Edit advisements using Icon in BannerPerson Show View Table (both Regular and Enhanced views).

![Advisement Edit](/app/assets/images/advEdit.jpg)

After submitting an edit, view is redirected to Advisement Show view. This includes an updated Accepted % Rate.
![Advisement Show](/app/assets/images/advShow.jpg)


##Controllers


### Some Advice
x  * For the IDs, don't mess with the primary `id` key that is made for you in a
  given table. Stick to a new column to hold the specific "id" requested.
x  * Ditto above for `date`. Don't hack around with `created_at` or anything.
  x * Ensure the high charts function is clean and makes sense for this mini app
    x * Leaning heavily on docs examples is fine: just ensure good, unique code
x  * Learn some new things
x :)  * Have fun!

### Helpful checklist

  * [x] Instantiate a github repo when you begin the challenge.
  * [x] Please **make the repo private**, and invite us.
  * [x] Make an initial commit.
  * [x] **Commit frequently** and push at least daily at the end of each day.
  * [x] Maybe include some helpful seed data. `Faker` _could_ help you there.
  * [x] Please **provide a readme** (other than the orginal one) explaining your
    decisions/actions where you have something to say.
  * [x] **Include screenshots** (in that readme) of what your mini app looks
    like!
  * [x] **Mention any other tech** you pulled in to help you if you did so.
  * [x] Read this challenge readme.

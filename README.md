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
  * Keep Accepted calculations in Concern methods
  * Ruby Controller Actions Conventions:
    * 7 types of Actions:
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

### Schema Specifics



### BannerPerson Show View

![Show View Graph](/app/assets/images/show.jpg)

#### BannerPerson Show View - Top (Graph)
Used `gon` and `highcharts-rails`

![Show View Graph](/app/assets/images/showTop.jpg)


MVP:


  Used this example as a guide:
  2018 Dosis Demo for tracking anemia HB levels against
  dose of medication

  ![Graph from Demo](/app/assets/images/demoGraph.jpg)



```

  ┌──────────────────────────────────────────────────────────────────────┐
  │                                                                      │▒
  │       ╔═══════════╗                        .●◟                       │▒
  │       ║ ...       ║                      ,'   ╰◟                     │▒
  │       ╚═════════▿═╝                    ,'       `╮                   │▒
  │                 ●─.          ●────────●           ╲                  │▒
  │                ◜   `─.    ,─'                      `◟,               │▒
  │               ╱       ╲  ╱                            ╲              │▒
  │   ●────●     ╱         ◝●                              ●             │▒
  │         ╲   ╱                                                 █  █   │▒
  │          ╲ ╱                                          █  █    █  █   │▒
  │           ●   █                                       █  █    █  █   │▒
  │      █  █  █  █    █  █      █  █ █      █  █         █  █    █  █   │▒
  │      █  █  █  █    █  █      █  █ █      █  █         █  █    █  █   │▒
  │      █  █  █  █    █  █      █  █ █      █  █         █  █    █  █   │▒
  └──────────────────────────────────────────────────────────────────────┘▒
   ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓

```

Source:


#### BannerPerson Show View - Bottom (Table)
![Show View Graph](/app/assets/images/showBottom.jpg)

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
##### Enhanced view mode:
![Show View Graph](/app/assets/images/showBottomEnhanced.jpg)

##### Regular view mode (allow toggle between two table view modes):


##### Table display values


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
  * [ ] Please **provide a readme** (other than the orginal one) explaining your
    decisions/actions where you have something to say.
  * [ ] **Include screenshots** (in that readme) of what your mini app looks
    like!
  * [x] **Mention any other tech** you pulled in to help you if you did so.
  * [x] Read this challenge readme.


### Our Part

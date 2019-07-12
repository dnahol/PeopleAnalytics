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

**% Accepted**.

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
  * [x] Please **provide a readme** (other than the orginal one) explaining your
    decisions/actions where you have something to say.
  * [ ] **Include screenshots** (in that readme) of what your mini app looks
    like!
  * [x] **Mention any other tech** you pulled in to help you if you did so.
  * [x] Read this challenge readme.


### Our Part

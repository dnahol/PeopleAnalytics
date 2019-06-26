# Quick rails app w/ graph

### Technologies explored (check the this skeleton)

* **Ruby** ('2.5.1')
* **Ruby on Rails** ('~> 5.1.6.2') — with Turbolinks
* **Postgres** ('~> 11.2')
* **HighCharts JS** —
  [here's an example][highcharts example]
* **Faker**

AND:
* Engineering principles:
  * MVC
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

**Advisements**
 **Target range
LoyaltyPoints should be a range of 10.0 pts to 15.0 pts**,

#### Help, what is a House BannerPerson? Give me some flavor text please?


---

### BannerPerson Show View


#### BannerPerson Show View (Graph)
Used `gon` and `highcharts-rails`



MVP:
  * **Shows every date in January 2019** in X-axis
  * Connected Points: Loyalty points (pts)
  * Bars: Handouts (units)

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


#### BannerPerson Show View (Table)
Takes up bottom portion of the page.
Can edit a date's Advisement.

**% Accepted**.

##### Enhanced view mode:
|  ID | HSID |  Date  |Loyalty | Handout |Advisement|% Accepted|
|:---:|:----:|:------:|:------:|:-------:|:--------:|:--------:|
| 123 | A-04 |01-13-19|  n/a   |900 units| 900 units|   100%   |
| 123 | A-04 |01-11-19| 9.0 pts|800 units|    n/a   |    67%   |
| 123 | A-04 |01-08-19|  n/a   |600 units|    n/a   |    67%   |
| 123 | A-04 |01-05-19|  n/a   |600 units|    n/a   |    67%   |
| 123 | A-04 |01-02-19|10.4 pts|   n/a   | 600 units|    0%    |
| ... |      |        |        |         |          |          |

##### Regular view mode (allow toggle between two table view modes):
A regular view mode that shows less information.
This table should also allows the editing of Advisements, through a
button and a form delivered in [any chosen medium (view/partial/modal/etc)]

|  Date  |Loyalty |Handout|Advisement|                     |
|:------:|:------:|:-----:|:--------:|:-------------------:|
|01-02-19|10.4 pts|  n/a  | 600 units|**[Edit Advisement]**|

##### Table display values
  * **ID**          (The internal database primary ID for a given BannerPerson)
  * **HSID**         (BannerPerson House Specific ID, see _Schema Specifics_)
  * **Date**
  * **Loyalty**
  * **Handout**
  * **Advisement**
  * **Button**
  * ##### % Accepted


### Some Advice
x  * For the IDs, don't mess with the primary `id` key that is made for you in a
  given table. Stick to a new column to hold the specific "id" requested.
x  * Ditto above for `date`. Don't hack around with `created_at` or anything.
  * Ensure the high charts function is clean and makes sense for this mini app
    * Leaning heavily on docs examples is fine: just ensure good, unique code
x  * Learn some new things
:)  * Have fun!

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
  * [ ] **Mention any other tech** you pulled in to help you if you did so.
  * [x] Read this challenge readme.


### Our Part

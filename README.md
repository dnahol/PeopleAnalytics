# Quick rails app w/ graph

### Technologies explored (check the this skeleton)

* **Ruby** ('2.5.1')
* **Ruby on Rails** ('~> 5.1.6.2') — with Turbolinks
* **Postgres** ('~> 11.2')
* **HighCharts JS** —
  [here's an example][highcharts example]
* **Faker**
* _Don't_ use a frontend library like **React**
* Whatever engineering principles you think help you solve this best

---

### Schema Specifics
You are building, at minimum, a single Show view for a `BannerPerson`.

A given `House` is made up of BannerPersons.

BannerPersons have a House-Specific ID which is unique within that House, e.g.,
`BannerPersonTudor3`. BannerPersons could move between Houses but may only be in
one active House at a time. If one House's `BannerPersonTudor3` moves to
another, they might receive a new specific ID like `Tudor-14` depending on how
that House styles their BannerPersons for internal records. These IDs might run
into some overlap and don't have to be unique across all data. There is no
restriction on what they look like.

BannerPersons have two specific metrics we want to keep track of, and **we want
to track both metrics in terms of which House the BannerPerson was a part of at
that time**.
  * **Loyalty Points** (`LoyaltyPoint`) measured about **once weekly** and have a
    points (pts) value of somewhere between **5.0 - 18.0** inclusive.
  * **Handouts** (`Handout`) are given **two to three times a week** at
    somewhere between **200 - 20_000** units inclusive (divisible by 100), and
    are **skipped about 5-10% of the time** due to nefarious circumstances

**Advisements** are given **every couple of weeks** or so per BannerPerson
(generated from an unseen algorithm consulted by a House Maester), and propose
new Handouts amounts if Loyalty Points drop below that House's setting for lower
targets or climb above that House's setting for upper targets. **Target range
for LoyaltyPoints should be a range of 10.0 pts to 15.0 pts**, which could, in
theory, be changed by each House depending how much they care about loyalty, but
isn't very important to get into.

**NB:** There are many different ways to organize this data given the above
(and below) items. More tables is not necessarily a bad thing, provided they
make sense and nothing is overly cluttered.

#### Help, what is a House BannerPerson? Give me some flavor text please?
A BannerPerson has meager holdings in the greater region held by a House. A
BannerPerson might from time to time change loyalties, and stop supporting
their House, change to a new House, or go back to an old House.

LoyaltyPoints are a metric measured on a given BannerPerson (perhaps some little
birds are reporting back to the House these metrics), and reflect a certain
number of points (pts) that determines how loyal the BannerPerson is to the
their current House.

A House wants to keep its BannerPersons' LoyaltyPoints in a certain range of
points:
  * Not enough points and the BannerPerson's loyalty becomes questionable
  * Too many points and the BannerPerson may garner more support of their
    sibling BannerPersons, and call a challenge to become the ruling House of
    the region (aka usurping, which tends to go poorly for those previously in
    power).

A House Maester is calculating relationships between these LoyaltyPoints and
Handouts and coming up with (by guidance from an ancient Three-Eyed Algorithm)
Advisements to improve LoyaltyPoints by giving the least amount of Handouts
possible. An Advisement proposes an amount of Handout Units to give next time a
Handout is... handed out.

A House doesn't always have the opportunity to consult the ancient algorithm, or
could forget to do so, and might increase or decrease their Handouts on the fly.

---

### BannerPerson Show View
Display relevant `BannerPerson` information useful to see. What to display is
kind of open-ended. We use [Slim templating](http://slim-lang.com/) for our main
frontend setup, which is an alternative to erb with "simpler" syntax. It is
fairly easy to pick up, and fun and/or/nor useful depending on personal
preferences, but not mandatory.

#### BannerPerson Show View (Graph)
Important. Should take up the top portion of the page. Requires that some
variables pass from Ruby to JavaScript. This is easily accomplished in a variety
of ways. One of the easier ways uses a gem called `gon`. Highcharts provides
really good examples and docs so setting up initially is not difficult. Below is
a rudimentary mock visual.

MVP:
  * **Show every date in January 2019**
  * Visualize a BannerPerson's relevant data points.
  * Don't display Advisements in the graph.
  * Decide which data should be the bars, and which the connected points
  * Pay attention to the details in the code here and the rendered display
  * This isn't a closed book exercise

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


#### BannerPerson Show View (Table)
Should take up the bottom portion of the page. At minimal, please display the
Enhanced view mode. Decide the best way to edit a given date's Advisement. It's
an open-ended edit/update. See the example row structures below.

**NB:** The example tables will help explain, in particular, how to calculate
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
For an added optional challenge, include a regular view mode that shows less
information. This table should also allow the editing of Advisements, through a
button and a form delivered in any chosen medium (view/partial/modal/etc).

|  Date  |Loyalty |Handout|Advisement|                     |
|:------:|:------:|:-----:|:--------:|:-------------------:|
|01-02-19|10.4 pts|  n/a  | 600 units|**[Edit Advisement]**|

##### Possible Table display values
  * **ID**          (The internal database primary ID for a given BannerPerson)
  * **SID**         (BannerPerson House Specific ID, see _Schema Specifics_)
  * **Date**
  * **Loyalty**
  * **Handout**
  * **Advisement**
  * **Button**

  * ##### % Accepted
      > Separate the calculation of `% Accepted` to an ActiveSupport Concern,
      don't clutter the model(s)/controller(s) with this logic. It's a simple
      way to improve readability of larger, more complicated applications.

      *(table above is a good reference for how this should be calculated)*

      Calculate a percent of accepted Handout amounts in a given span between
      two Advisements and display that through the lifespan of the Advisement.

      An Advisement should be considered active from the date it is created
      until the next Advisement datum is created. The `% Accepted` will be
      uniform through the span between Advisements, and will mutate anytime a
      new `Handout` amount is added during that span. Again, please see the
      above table for clues seeing how this should work.

---

### Some Advice
  * For the IDs, don't mess with the primary `id` key that is made for you in a
  given table. Stick to a new column to hold the specific "id" requested.
  * Ditto above for `date`. Don't hack around with `created_at` or anything.
  * Ensure the high charts function is clean and makes sense for this mini app
    * Leaning heavily on docs examples is fine: just ensure good, unique code
  * Learn some new things
  * Have fun!

### Helpful checklist

  * [ ] Instantiate a github repo when you begin the challenge.
  * [ ] Please **make the repo private**, and invite us.
  * [ ] Make an initial commit.
  * [ ] **Commit frequently** and push at least daily at the end of each day.
  * [ ] Maybe include some helpful seed data. `Faker` _could_ help you there.
  * [ ] Please **provide a readme** (other than this one) explaining your
    decisions/actions where you have something to say.
  * [ ] **Include screenshots** (in that readme) of what your mini app looks
    like!
  * [ ] **Mention any other tech** you pulled in to help you if you did so.
  * [x] Read this challenge readme.


### Our Part

We'll clone your app locally and run the usual `bundle exec...` `foo`, `bar`,
etc. to have a look at what you've built. We probably won't fix anything or run
anything to clean up code, so please ensure style/readability is decently tidy!

Enjoy 🙌


[highcharts example]: https://jsfiddle.net/gh/get/library/pure/highcharts/highcharts/tree/master/samples/highcharts/demo/bar-stacked/

/*
 * Authors : Christopher Miguel
 * Project : Sports de combat
 * Date : 26.01.2020
*/

CREATE VIEW viewStportDeCombat AS
(SELECT COUNT(Styles.id) as Styles, COUNT(Gears.id) as Gears, COUNT(Statistics.id) as Statistics, COUNT(Clubs.id) as Clubs, COUNT(Fighters.id) as Fighters, COUNT(Status.id) as Status, COUNT(Sponsors.id) as Sponsors, COUNT(Contests.id) as Contests, COUNT(Categories.id) as Categories, COUNT(Titles.id) as Titles, COUNT(Fights.id) as Fights
Total = Styles + Gears + Statistics + Clubs + Fighters + Status + Sponsors + Contests + Categories + Titles + Fights
from customers
FULL JOIN articles on articles.id = customers.id
FULL JOIN shops on shops.id = articles.id
FULL JOIN descriptions on descriptions.id = shops.id
FULL JOIN promotions on promotions.id = descriptions.id
FULL JOIN orders on orders.id = promotions.id
FULL JOIN components on components.id = orders.id
FULL JOIN benefit on benefit.id = components.id
FULL JOIN emails on emails.id = benefit.id
FULL JOIN fairphones on fairphones.id = emails.id);

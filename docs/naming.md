
## Naming Conversions

We are introducing a new naming conversions to many eyes. This has began to evolve since 2012, to address some pragmatic problems for iOS programmers. It is NOT about weather English is your mother tongue, rather a format for type names to express many facets of its semantics and categories.

For human developers' legibility/readability.

For machine/program checking. Source code compilers can check source code's syntax and generate object code. The first feature of it is helping human programmers to find their writing syntax errors. This naming conversions is yet another tool to check our source code's quality. Rather it checks on architectural and semantics errors that human programmers left in code. You will see how later soon.

## Attributes of a type.

> When you have a name for it, you have the power to talk about it. - someone

* belonging (domain). E.g. which framework or project/application it belongs too. For iOS native frameworks types, there are 2-or-3 upper-cased prefix, such as UI, SCN, etc.
* role. As an experienced programer of MVC in iOS, you know what is `UIViewController` and what is `UIView`, and the relationship between them. These attribute is what i called _role_. Roles come with defined responsibilities, another way to say requirements. It also requires you in-depth knowledge and skills on particular role to take full advantage of the system. (Have you read through API reference on [`UIViewController`](https://developer.apple.com/reference/uikit/uiviewcontroller) carefully?)
  * In [roles](roles.md) document, there are detailed roles with concerns of use and writing.
* model. In a well-known example (at least in Chinese textbook on database design) of student score system, a Student, Class, Score are entities/tables/models.
* optionally, sub-model.
* optionally, implementation variant. Think this, you want to create a UIViewController to show a Student's detailed information. You can implement this in varied ways, such as using UITableView, or creating it in Storyboard/IB, or creating its UI by code only. These are well-established implementation variant.

## Old, naive way to name.

If you want to create a UIViewController to show a Student's detailed information, with UITableViewController, how do you name the class and file?

`StudentViewController`?

There are some problems on that, related to above mentioned attributes of a type.
* Reusability, if no belonging prefix.
* `StudentView-Controller`? or `Student-ViewController`? This format does not give a human programmer a visual clue to recognize it easily. and it leaves no room for machine/program to help you to check.
* No clue on internal implementation. Also, later when you are asked to make a Student ViewController in storyboard, how to name it?

## New way to name

`XYZ_UIVC_Student__UITableView`

* `XYZ` can be in any length, any letter cases (upper or lower), and any contents ("\_" is forbidden), to express your business, framework, or project. (domain)
* `UIVC` is an abbr. for `UIViewController`, a role name.
* After first double underscore "\_\_", it will be free form to express implementation invariant or any other non-domain-role-model concerns.

# PHP - Traits

[PHP: Traits - Manual](https://www.php.net/manual/en/language.oop5.traits.php)

> Traits are a mechanism for code reuse in **single inheritance languages** such as PHP. A Trait is intended to **reduce some limitations of single inheritance** by enabling a developer to reuse sets of methods freely in several **independent classes** living in **different class hierarchies**. The semantics of the combination of Traits and classes is defined in a way which reduces complexity, and **avoids the typical problems associated with multiple inheritance and Mixins**.
>
> A Trait is similar to a class, but only intended to group functionality in a **fine-grained and consistent** way. **It is not possible to instantiate a Trait on its own.** It is an addition to traditional inheritance and enables **horizontal composition of behavior**; that is, the application of class members **without requiring inheritance**.

- [Precedence](https://www.php.net/manual/en/language.oop5.traits.php#language.oop5.traits.precedence)

> An inherited member from a base class is overridden by a member inserted by a Trait. The precedence order is that members from the current class override Trait methods, which in turn override inherited methods.

- [Multiple Traits](https://www.php.net/manual/en/language.oop5.traits.php#language.oop5.traits.multiple)

- [Conflict Resolution](https://www.php.net/manual/en/language.oop5.traits.php#language.oop5.traits.conflict)

> To resolve naming conflicts between Traits used in the same class, the `insteadof` operator needs to be used to choose exactly one of the conflicting methods.
>
> Since this only allows one to exclude methods, the `as` operator can be used to add an alias to one of the methods.

- [Changing Method Visibility](https://www.php.net/manual/en/language.oop5.traits.php#language.oop5.traits.visibility)

- [Traits Composed from Traits](https://www.php.net/manual/en/language.oop5.traits.php#language.oop5.traits.composition)

- [Abstract Trait Members](https://www.php.net/manual/en/language.oop5.traits.php#language.oop5.traits.abstract)

> **Caution**: A concrete class fulfills this requirement by defining a concrete method with the same name; **its signature may be different**.

- [Static Trait Members](https://www.php.net/manual/en/language.oop5.traits.php#language.oop5.traits.static)

- [Properties](https://www.php.net/manual/en/language.oop5.traits.php#language.oop5.traits.properties)

> Traits can also define properties.

> If a trait defines a property then a class can not define a property with the same name unless it is compatible (**same visibility and initial value**), otherwise a fatal error is issued.

# Becomes

A hack, in coordination with [@coreyhaines](https://github.com/coreyhaines),
and with little adult supervision, to make one Objective-C object behave like
another. Think, extending an object with a module in Ruby

```ruby
jedi = AnakinSkywalker.new
jedi.side_of_the_force #=> "Light Side"
jedi.force_choke #=> NoMethodError
jedi.extend(DarkSide)
jedi.side_of_the_force #=> "Dark Side"
jedi.force_choke #=> :metal:, you're choking!
```

Except in Objective-C it looks more like

```objective-c
id jedi = [[AnakinSkywalker alloc] init];
[jedi sideOfTheForce]; // @"Light Side"
[jedi forceChoke]; // NSInvalidArgumentException
[jedi becomes:[DarkSide class]];
[jedi sideOfTheForce]; // @"Dark Side"
[jedi forceChoke]; // :metal:, you're choking!
```

### License

See the [LICENSE file](LICENSE.md)

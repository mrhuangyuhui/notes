# Keyboard

## Notifications

`UIKeyboardWillShowNotification`

`UIKeyboardDidShowNotification`

`UIKeyboardWillHideNotification`

`UIKeyboardDidHideNotification`

```objc
[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];

[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
```

# UITextView

限制输入长度

```objc
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text isEqualToString:@""] && range.length > 0) {
        return YES;
    } else {
        if (textView.text.length - range.length + text.length > 200) {
            return NO;
        } else {
            return YES;
        }
    }
}
```

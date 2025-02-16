To fix this, always remove the observer in the observer's `dealloc` method:

```objectivec
@interface MyObserver : NSObject
@property (nonatomic, weak) ObservedObject *observedObject;
@end

@implementation MyObserver
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    // Your KVO handling code here
}

- (void)dealloc {
    [self.observedObject removeObserver:self forKeyPath:@"observedProperty"];
}
@end
```
This ensures that the observer is removed even if the observed object deallocates before the observer.
// Convert to String
NSError * err;
NSData * jsonData = [NSJSONSerialization  dataWithJSONObject:yourDictionary options:0 error:&err];
NSString * myString = [[NSString alloc] initWithData:jsonData   encoding:NSUTF8StringEncoding];
NSLog(@"%@",myString);

// Convert Back to Dictionary
NSError * err;
NSData *data =[myString dataUsingEncoding:NSUTF8StringEncoding];
NSDictionary * response;
if(data!=nil){
 response = (NSDictionary *)[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&err];
}

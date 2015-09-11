# DDTouchCircleButton
a view that long press show progress bar outside


self.drawCirleButton = [[DDTouchCircleButton alloc] initWithFrame:CGRectMake(105, 180, 110, 110)];
self.drawCirleButton.duration = 0.75;
self.drawCirleButton.backgroundColor = [UIColor whiteColor];
self.drawCirleButton.trackTintColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.24];
self.drawCirleButton.progressTintColor = [UIColor colorWithRed:247/255.0f green:95/255.0f blue:50/255.0f alpha:1.0];
self.drawCirleButton.lineWidth = 6.0;
self.drawCirleButton.image = [UIImage imageNamed:@"run_stop_icon@2x"];
<!--self.drawCirleButton.delegate = self;-->

[self.view addSubview:self.drawCirleButton];

[self.drawCirleButton addTarget:self action:@selector(ddStrokeAnimationDidFinished) forControlEvents:UIControlEventTouchUpInside];


- (void)ddStrokeAnimationDidFinished{
//事件
}
# 30 Day App Challenge
This challenge was inspired by Gareth Jones's Medium article (https://medium.com/@gpj/30-apps-in-30-days-6686a570e90) where he created a mobile app everyday for a month. I wanted to challenge myself to improve my iOS development skills and do the same thing, so I'm going to be making an app everyday in the month of March 2019. 

![alt text](https://cdn-images-1.medium.com/max/2560/1*HrhwTIbp2hchH0-GmbKusg.jpeg)

## Rules
1. Fresh Xcode Project created after 12AM of each day 
2. Re-use as little code as possible 
3. No storyboards: everything must be 100% in code
3. Commit MVP of each app to GitHub by 11:59 PM each day
4. Rinse & Repeat

## Lines of Code Written So Far This Month: 
```
3,827
```

## Day 1: Random Color Generator 
An app that gives users random colors when they shake their device: displays the color, hex value, and RGB value. ~Also allows users to store their favorite colors for later use.~ 

![alt text](https://github.com/vlad-munteanu/30Apps_30Days/blob/master/Screenshots/Gifs/Day1.gif)

## Day 2: Speed Limit Checker
An app that checks if user is going speed limit and alerts them if they are speeding by changing color of background. Only works on VA streets because the way the data parsing is set up, it only checks speed against VA laws. I was not able to find a free API to check speed limits everywhere.

![alt text](https://github.com/vlad-munteanu/30Apps_30Days/blob/master/Screenshots/Gifs/Day2.gif) 

## Day 3: SSH Shell
An app that allows the user to open an SSH shell, using the NMSSH library. This app is really just a proof of concept because it can successfully open a shell but is quite buggy: users have to enter credentials in the XCode workspace, the shell freezes a lot, and the text formatting is all over the place. I had a lot of school stuff to finish today so I wasn't able to perfect it completely, but still a cool app regardless.  

![alt text](https://github.com/vlad-munteanu/30Apps_30Days/blob/master/Screenshots/Gifs/Day3.gif)

## Day 4: Study App (Pomodoro Technique) 
An app aimed at helping users study better, based on the Pomodoro technique. Not only acts as a study timer, but also forces users to enable airplane mode to focus. Created UI to be completely dark, in order to preserve battery on iPhones with OLED displays. Used CDAlertView for custom alert views and Reachability for detecting if wifi/LTE is enabled.

![alt text](https://github.com/vlad-munteanu/30Apps_30Days/blob/master/Screenshots/Gifs/Day4.gif)

## Day 5: Pwned  
An app that connects to the ESP8266 Deauther 2.0 interface for network pen-testing. Only meant for use on personal networks. Uses WKZombie to run JS code to interact with the web interface for the Deauther. Wasn't able to finish in time so I opted to use a webview for the scan view. Works with any devices that use 802.11 Wi-Fi standard. 

![alt text](https://github.com/vlad-munteanu/30Apps_30Days/blob/master/Screenshots/Gifs/Day5.gif)

## Day 6: Text to speech
An app that converts text to speech. Allows users to choose different voices and to save phrases.

![alt text](https://github.com/vlad-munteanu/30Apps_30Days/blob/master/Screenshots/Gifs/Day6.gif)

## Day 7: The Dengster
A spritekit based app that allows users to draw on the screen with an uploaded photo of my friend's face. App is named after and was originally inspired by a close friend in my IB Computer Science class. 

![alt text](https://github.com/vlad-munteanu/30Apps_30Days/blob/master/Screenshots/Gifs/Day7.gif) 

## Day 8: BAC Calculator 
Allows user to calculate approximate blood alcohol concentration (BAC) using the Widmark formula. Used Eureka to create form view. Also created a new sick launchscreen for my future apps.

![alt text](https://github.com/vlad-munteanu/30Apps_30Days/blob/master/Screenshots/Gifs/Day8.gif)

## Day 9: Coin Flip 
An app that makes decisions for the user by the flip of the coin. Has a cool flip animation. ~Also has an Apple Watch companion app.~ 

![alt text](https://github.com/vlad-munteanu/30Apps_30Days/blob/master/Screenshots/Gifs/Day9.gif)

## Day 10: SSH (Apple Watch)
An app that lets users send an SSH command (defined in the iPhone app) from their Apple Watch with the press of a button. 

![alt text](https://github.com/vlad-munteanu/30Apps_30Days/blob/master/Screenshots/Gifs/Day10.gif)

## Day 11: School App (Apple Watch)
An app that fetches the number of absences and GPA from PowerSchool and pushes it to an Apple Watch complication. PowerSchool doesn't have an open mobile API that I could use, so I had to do some manual parsing through the iPhone app.

![alt text](https://github.com/vlad-munteanu/30Apps_30Days/blob/master/Screenshots/Day11.PNG)

## App Ideas TO_DO 
- [ ] Raspberry PI App 
- [ ] Snow day chance calculator 
- [ ] Restaurant chooser (for lunch)

## Apps I Might Do Further Development On 
- Day 4: Study App 
  - Add Push notifications 
- Day 5: Pwned
  - Get rid of webkit view



## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE) file for details

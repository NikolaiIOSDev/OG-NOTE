# OG-NOTE



<p align="center">
      <img src="https://user-images.githubusercontent.com/99130444/222644874-c3db51ef-7942-4e98-a272-fec2fa12eafc.png" width="400">
</p>

<p align="center">
   <img src="https://img.shields.io/badge/Swift-5.0-important">
   <img src="https://img.shields.io/badge/Platform-IOS-inactive">
   <img src="https://img.shields.io/badge/Architecture-VIPER-brightgreen">
   <img src="https://img.shields.io/badge/Data%20Interaction-Core%20Data-informational">
</p>

## Description

I present to your attention the application OG NOTE, for real OG, which allows you to write down notes, and thereby informationally unload your head.  🫠  
The functionality of the application includes creating, reading, editing, deleting notes.  📝  
In addition, you can add photos to notes so that you don’t forget what you need to do.  📸  
The application is built on the VIPER architecture, interaction with data is carried out using Core Data.  📬  
And also implemented the animation of the boot screen.  🎬  

## Animated Splash Screen 

<p align="center">
<img src="https://user-images.githubusercontent.com/99130444/222651732-778f724a-df7e-4053-aa39-311f95c64f4d.gif" width=280>
</p>

### Animation Implementation

```swift
@IBOutlet var logoLabel:UILabel!
@IBOutlet var constraintLogo: NSLayoutConstraint!
@IBOutlet var constraintLogoBottom: NSLayoutConstraint!

//MARK: - Animations for Label
    private func animations(){
        constraintLogo.constant = 0
        UIView.animate(withDuration: 1.0,
                       delay: 0.3,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 1.0,
                       options: [.curveLinear], animations:
                        {
            self.view.layoutIfNeeded()
        })
        timer=Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(animationsBottom), userInfo: nil, repeats: false)
        timer = Timer.scheduledTimer(timeInterval: 2.6, target: self, selector: #selector(goToMain), userInfo: nil, repeats: false)
    }
    
    @objc private func animationsBottom(){
        constraintLogoBottom.constant = -1000
        UIView.animate(withDuration: 1.0,
                       delay: 0.3,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 1.0,
                       options: [.curveLinear]) {
            self.view.layoutIfNeeded()   
        }        
    }


```


## Screenshot

### First Module

<img src="https://user-images.githubusercontent.com/99130444/222684346-f6d39080-eae7-4a80-bf5a-a3454f7edbe2.png" width="280"> <img src="https://user-images.githubusercontent.com/99130444/222684531-648da961-03aa-4c66-81f9-9d3c905b43e3.png" width="280">   
<img src="https://user-images.githubusercontent.com/99130444/222684649-8431ba68-066b-4ba3-ab2a-90dfe194ec08.png" width="280"> <img src="https://user-images.githubusercontent.com/99130444/222684747-10e9a39e-98ed-4555-a9c4-0250bc18efef.png" width="280">



### Second Module

<img src="https://user-images.githubusercontent.com/99130444/222685189-20c708ab-3c42-42b0-a88d-01dc4f1c2fcb.png" width="280"> <img src="https://user-images.githubusercontent.com/99130444/222685283-589dce8c-cad1-4e05-9d85-fc10df06d5e8.png" width="280">   
<img src="https://user-images.githubusercontent.com/99130444/222685385-3c91d55f-dd20-4afd-859c-aa40ca0c4fab.png" width="280"> <img src="https://user-images.githubusercontent.com/99130444/222685413-db7d2b8e-57ec-4abe-8075-4e3d6b465345.png" width="280">





## Developer

- Федоров Николай (https://github.com/NikolaiIOSDev)

## Ending

If you have ideas regarding the implementation, code refactoring or additional features, create a pull request.  
I will be glad to see your implementations.


---
title: Jugglenaut
author: TJ Bearse
date: June 10th, 2019
---
Jugglenaut is the first game in my attempt at the [Game a Week Challenge](./gameaweek.md). It was developed with the theme "10 second gameplay" in mind. It can be played online and the source is also available via [github repository](https://github.com/tjbearse/jugglenaut). I'd be happy to hear any comments you may have or bugs you encounter.

**[Play Jugglenaut](../games/jugglenaut)** (best experienced with a gamepad controller)


## What I Learned

- I used the new input system in Unity for the first time. Using input actions references made it easier to abstract keybindings from the behaviours. I also learned about C# delegates in the process. 
[HandGrab.cs](https://github.com/tjbearse/jugglenaut/blob/master/Assets/scripts/hand/HandGrab.cs) has an example of this. This also had the benefit of making keybindings much easier to configure in the editor.
- I used UI components. This is the first project in which I've used text components. The use here was really basic but a good starting place.
- I experimented with a static Event manager pattern. I used static functions to manage state changes (e.g. game over, restart, see [EventManager.cs](https://github.com/tjbearse/jugglenaut/blob/master/Assets/scripts/phaseChanges/EventManager.cs)). Using a delegate for this made it easy to tie behaviors to these events. I was able to create a few reusable scripts for these. This spread the phase logic around a lot but also kept it close to the objects it affected so it was usually easy to find.

## Things To Do Differently Next Time
- Put sprites in a sprite sheet rather than individual files. This would make it easier to be consistent, e.g. sharing a palet, comparative size, and is just as easy.
- Controller focused input isn't ideal for sharing. The controls assume that you have a compatible controller available can limit the audience a bit. Could address this either by altering the design or by providing a similar feel on keyboards. In this case gravity could have been a good "analog" for analog input but I wasn't sure how to add that in along side my current input options.
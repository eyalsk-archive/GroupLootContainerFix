# GroupLootContainerFix

Fixes the following issues that relate to the `GroupLootContainer`:

1. By default `GroupLootContainer` is set to receive mouse events and thus when it's shown, it blocks the `WorldFrame` from receiving mouse events.
2. Seems like frames added to `GroupLootContainer.rollFrames` aren't being removed for some reason and this affects positioning of the roll frames such as `BonusRollFrame`.
3. Due to #2 the size of the `GroupLootContainer` grows indefinitely.

**Things I don't know**

* I don't know whether Blizzard broke this before patch 8.1 or after it.
* I don't know whether an addon is causing it but to me this seems really unlikely and more like a bug Blizzard introduced.

**Possible related issues**

* https://eu.forums.blizzard.com/en/wow/t/mouse-left-and-right-buttons-wouldnt-respond-at-times/15193
* https://eu.forums.blizzard.com/en/wow/t/mouse-movement-cuts-out/12871/28
* https://eu.forums.blizzard.com/en/wow/t/after-8-1-i-sometimes-cant-right-click-to-turn-my-screen/12893/11
* https://eu.forums.blizzard.com/en/wow/t/problems-rotating-the-camera-with-right-click/1333/27
* https://us.forums.blizzard.com/en/wow/t/mouse-response-mid-screen/46606

**Notes**

This is only a workaround and shouldn't be considered the final solution; Blizzard should look into the issues above and fix it.

### **Enjoy!**
import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.SetWMName
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.ICCCMFocus
import XMonad.Hooks.ManageDocks
import XMonad.StackSet hiding (workspaces)
import XMonad.Actions.SpawnOn

myModMask = mod4Mask  -- rebind Mod to Super key
myTerminal = "gnome-terminal"
myBorderWidth = 2
focusColor = "#9BB12F"
textColor = "#000000"
lightTextColor = "#3A4700"
backgroundColor = "#5071DE"
lightBackgroundColor = "#3A4700"
myUrgentColor = "#ffc000"
myNormalBorderColor = "#000000"
myFocusedBorderColor = "#ff0000"

myWorkspaces = [ "1:main"
               , "2:chat"
               , "3:mail"
               , "4:webz"
               , "5:all"
               , "6:all"
               , "7:all"
               , "8:spotify"
               , "9:all"
               ]


myLogHook xmproc = dynamicLogWithPP $ xmobarPP {
                     ppOutput = hPutStrLn xmproc
                   , ppTitle = xmobarColor lightTextColor ""
                   , ppCurrent = xmobarColor focusColor ""
                   , ppVisible = xmobarColor lightTextColor ""
                   , ppHiddenNoWindows = xmobarColor lightBackgroundColor ""
                   , ppUrgent = xmobarColor myUrgentColor ""
                   , ppSep = " :: "
                   , ppWsSep = " "
                   }

myManageHook = composeAll
    [ className =? "Gimp"          --> doFloat
    , className =? "Vncviewer"     --> doFloat
    , className =? "Pidgin"        --> doShift "2:chat"
    , className =? "Thunderbird"   --> doShift "3:mail"
    , className =? "Firefox"       --> doShift "4:webz"
    , className =? "Spotify"       --> doShift "8:spotify"
    ]

myStartupHook :: X()
myStartupHook = do
    spawnOn "1:main" "gnome-terminal"
    spawnOn "2:chat" "pidgin"
    spawnOn "3:mail" "thunderbird"
    spawnOn "4:webz" "firefox"

main = do
       xmproc <- spawnPipe "xmobar ~/.xmonad/xmobar"
       xmonad $ defaultConfig {
             startupHook = myStartupHook
             , terminal = myTerminal
             , borderWidth = myBorderWidth
             , focusedBorderColor = myFocusedBorderColor
             , normalBorderColor = myNormalBorderColor
             , manageHook = manageDocks <+> manageSpawn <+> myManageHook <+> manageHook defaultConfig
             , modMask = myModMask
             , logHook = myLogHook xmproc >> ewmhDesktopsLogHook >> setWMName "LG3D" >> takeTopFocus
             , workspaces = myWorkspaces
             }


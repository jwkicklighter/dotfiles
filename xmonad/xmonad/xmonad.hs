import XMonad
import qualified XMonad.StackSet as W
import qualified Data.Map as        M
import XMonad.Layout.Spacing
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import System.IO
import Graphics.X11.ExtraTypes.XF86

myTerminal           = "urxvt"
myNormalBorderColor  = myLightGray
myFocusedBorderColor = myYellow
myWorkspaces         = ["web","shell","msg","app"]
myWindowSpacing      = 5

-- Color Codes
myYellow         = "#e2a802"
myGreen          = "#39c48e"
myGray           = "#999999"
myAlmostDarkGray = "#4f4f4f"
myDarkGray       = "#1f1f1f"
myLightGray      = "#cccccc"
myBlue           = "#3f7dde"

main = do
    xmproc <- spawnPipe "/usr/bin/xmobar /home/lnx/.xmobarrc"
    xmonad $ defaultConfig
      { borderWidth        = 1
      , terminal           = myTerminal
      , normalBorderColor  = myNormalBorderColor
      , focusedBorderColor = myFocusedBorderColor
      , keys               = myKeys
      , workspaces         = myWorkspaces
      , focusFollowsMouse  = False
      , manageHook         = manageDocks <+> manageHook defaultConfig
      , layoutHook         = avoidStruts myLayout
      , handleEventHook    = mconcat 
                           [ docksEventHook
                           , handleEventHook defaultConfig ]
      , logHook            = dynamicLogWithPP xmobarPP
        { ppOutput = hPutStrLn xmproc
        , ppTitle = xmobarColor "green" "" . shorten 50
        }
      }

myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
 
  -- launch a terminal
  [ ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)

  -- Backlight Keys
  , ((modm, xF86XK_MonBrightnessUp), spawn "xbacklight -inc 10")
  , ((modm, xF86XK_MonBrightnessDown), spawn "xbacklight -dec 10")

  -- Keyboard Light Keys
  , ((modm, xF86XK_KbdBrightnessUp), spawn "kb-light +")
  , ((modm, xF86XK_KbdBrightnessDown), spawn "kb-light -")

  -- Rotate through the available layout algorithms
  , ((modm, xK_space ), sendMessage NextLayout)

  -- swap window with master window
  , ((modm, xK_Return), windows W.swapMaster)

  -- close current window
  , ((modm .|. shiftMask, xK_c), kill)

  -- expand master area
  , ((modm, xK_h), sendMessage Shrink)

  -- expand master area
  , ((modm, xK_l), sendMessage Expand)

  -- reset layout of current workspace
  , ((modm .|. shiftMask, xK_space), setLayout $ XMonad.layoutHook conf)

  -- launch rofi
  , ((modm, xK_p), spawn "myrofi")
  , ((mod4Mask, xK_space), spawn "myrofi")

  -- Move focus to the next window
  , ((modm, xK_Tab), windows W.focusDown)
  , ((modm .|. shiftMask, xK_Tab), windows W.focusUp)

  -- Restart xmonad
  , ((modm , xK_q), spawn "xmonad --recompile; xmonad --restart")
  ]
  ++

  -- mod-[1..9], Switch to workspace N
  -- mod-shift-[1..9], Move client to workspace N
  [((m .|. modm, k), windows $ f i)
  | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_4]
  , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]

myLayout = tiled ||| Mirror tiled ||| Full
  where
    tiled = spacing myWindowSpacing $ Tall nmaster delta ratio
    nmaster = 1
    ratio = 7/12
    delta = 3/100

{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
-- A simple program to demonstrate Gtk2Hs.
module Main (Main.main) where

import Relude
import qualified GI.Gtk as Gtk (main, init)
import GI.Gtk
       (widgetShowAll, setContainerChild, widgetDestroy, onButtonClicked,
        setButtonLabel, buttonNew, setWindowTitle, setContainerBorderWidth,
        mainQuit, onWidgetDestroy, windowNew)
import GI.Gtk.Enums (WindowType(..))


main :: IO ()
main = do
  Gtk.init Nothing
  window <- windowNew WindowTypeToplevel
  onWidgetDestroy window mainQuit
  setContainerBorderWidth window 10
  setWindowTitle window "Hello World"

  button <- buttonNew
  setButtonLabel button "Hello World"

  onButtonClicked button $ do
    putStrLn "Hello world button clicked. Closing window."
    widgetDestroy window

  setContainerChild window button
  widgetShowAll window
  Gtk.main

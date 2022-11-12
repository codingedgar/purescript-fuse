module Fuse where

import Prelude

import Data.Function.Uncurried (Fn2, runFn2)
import Effect (Effect)
import Prim.Row (class Union)

foreign import data Fuse :: forall a. a -> Type

type Options =
  ( isCaseSensitive :: Boolean
  , includeScore :: Boolean
  , shouldSort :: Boolean
  , includeMatches :: Boolean
  , findAllMatches :: Boolean
  , minMatchCharLength :: Int
  , location :: Int
  , threshold :: Number
  , distance :: Int
  , useExtendedSearch :: Boolean
  , ignoreLocation :: Boolean
  , ignoreFieldNorm :: Boolean
  , fieldNormWeight :: Int
  , keys :: Array String
  )

foreign import _newFuse :: forall items opts. Fn2 (Array items) opts (Fuse items)

newFuse :: forall items opts opts_. Union opts opts_ Options => Record opts -> (Array items) -> (Fuse items)
newFuse options list =
  runFn2 _newFuse list options

foreign import _search :: forall items. Fn2 (Fuse items) String (Array items)

search :: forall items. (Fuse items) -> String -> Array items
search fuse pattern =
  runFn2 _search fuse pattern

foreign import _setCollection :: forall items. Fn2 (Fuse items) (Array items) (Effect Unit)

setCollection :: forall items. (Fuse items) -> Array items -> Effect Unit
setCollection fuse docs =
  runFn2 _setCollection fuse docs

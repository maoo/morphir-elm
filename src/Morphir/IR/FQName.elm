{-
Copyright 2020 Morgan Stanley

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
-}


module Morphir.IR.FQName exposing (FQName(..), fQName, fromQName, getPackagePath, getModulePath, getLocalName)

{-| Module to work with fully-qualified names. A qualified name is a combination of a package path, a module path and a local name.

@docs FQName, fQName, fromQName, getPackagePath, getModulePath, getLocalName

-}

import Morphir.IR.Name exposing (Name)
import Morphir.IR.Path exposing (Path)
import Morphir.IR.QName as QName exposing (QName)


{-| Type that represents a fully-qualified name.
-}
type FQName
    = FQName Path Path Name


{-| Create a fully-qualified name.
-}
fQName : Path -> Path -> Name -> FQName
fQName packagePath modulePath localName =
    FQName packagePath modulePath localName


{-| Create a fully-qualified from a qualified name.
-}
fromQName : Path -> QName -> FQName
fromQName packagePath qName =
    FQName packagePath (qName |> QName.getModulePath) (qName |> QName.getLocalName)


{-| Get the package path part of a fully-qualified name.
-}
getPackagePath : FQName -> Path
getPackagePath (FQName p _ _) =
    p


{-| Get the module path part of a fully-qualified name.
-}
getModulePath : FQName -> Path
getModulePath (FQName _ m _) =
    m


{-| Get the local name part of a fully-qualified name.
-}
getLocalName : FQName -> Name
getLocalName (FQName _ _ l) =
    l

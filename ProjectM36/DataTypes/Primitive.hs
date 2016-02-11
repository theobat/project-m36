{-# LANGUAGE OverloadedStrings #-}
module ProjectM36.DataTypes.Primitive where
import ProjectM36.Base
import Data.Proxy
import Data.Typeable
import ProjectM36.AtomConstructor
import ProjectM36.ConcreteTypeRep
import qualified Data.Map as M
import qualified Data.Text as T
import qualified Data.ByteString as BS

atomTypeForProxy :: (Atomable a) => Proxy a -> AtomType
atomTypeForProxy prox = AtomType $ CTR (typeRep prox)

textAtomType :: AtomType
textAtomType = atomTypeForProxy (Proxy :: Proxy T.Text)

intAtomType :: AtomType
intAtomType = atomTypeForProxy (Proxy :: Proxy Int)

boolAtomType :: AtomType
boolAtomType = atomTypeForProxy (Proxy :: Proxy Bool)

doubleAtomType :: AtomType
doubleAtomType = atomTypeForProxy (Proxy :: Proxy Double)

byteStringAtomType :: AtomType
byteStringAtomType = atomTypeForProxy (Proxy :: Proxy BS.ByteString)

primitiveAtomTypes :: AtomTypes
primitiveAtomTypes = M.fromList $ map (\(typeName,typ) -> (typeName, (typ, emptyAtomConstructor))) prims
  where
    prims = [("Int", intAtomType),
             ("Text", textAtomType),
             ("Double", doubleAtomType),
             ("Bool", boolAtomType),
             ("ByteString", byteStringAtomType)
            ]

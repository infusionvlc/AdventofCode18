{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_adventofcode (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/vitcord23/Documents/Gits/AdventofCode18/cotel/.stack-work/install/x86_64-osx/lts-12.20/8.4.4/bin"
libdir     = "/Users/vitcord23/Documents/Gits/AdventofCode18/cotel/.stack-work/install/x86_64-osx/lts-12.20/8.4.4/lib/x86_64-osx-ghc-8.4.4/adventofcode-0.1.0.0-2LLd5PowqF6Jw2Ui5qJxAb"
dynlibdir  = "/Users/vitcord23/Documents/Gits/AdventofCode18/cotel/.stack-work/install/x86_64-osx/lts-12.20/8.4.4/lib/x86_64-osx-ghc-8.4.4"
datadir    = "/Users/vitcord23/Documents/Gits/AdventofCode18/cotel/.stack-work/install/x86_64-osx/lts-12.20/8.4.4/share/x86_64-osx-ghc-8.4.4/adventofcode-0.1.0.0"
libexecdir = "/Users/vitcord23/Documents/Gits/AdventofCode18/cotel/.stack-work/install/x86_64-osx/lts-12.20/8.4.4/libexec/x86_64-osx-ghc-8.4.4/adventofcode-0.1.0.0"
sysconfdir = "/Users/vitcord23/Documents/Gits/AdventofCode18/cotel/.stack-work/install/x86_64-osx/lts-12.20/8.4.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "adventofcode_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "adventofcode_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "adventofcode_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "adventofcode_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "adventofcode_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "adventofcode_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)

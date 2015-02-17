--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import           Data.Monoid (mappend)
import           Hakyll

--------------------------------------------------------------------------------
main :: IO ()
main = hakyll $ do
    match "images/*" $ do
        route   idRoute
        compile copyFileCompiler

    match "files/*" $ do
        route   idRoute
        compile copyFileCompiler

    match "css/*" $ do
        route   idRoute
        compile compressCssCompiler

    match "templates/*" $ compile templateCompiler

    match (fromList ["index.markdown"]) $ do
        route   $ setExtension "html"
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/default.html" defaultContext
            >>= relativizeUrls

    match "paradises/*" $ do
        route $ setExtension "html"
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/paradise.html" postCtx
            >>= loadAndApplyTemplate "templates/default.html"  postCtx
            >>= relativizeUrls

    create ["paradises.html"] $ do
        route idRoute
        compile $ do
            paradises <- loadAll "paradises/*"
            let archiveCtx =
                    listField "paradises" postCtx (return paradises) `mappend`
                    constField "title" "Paradises" `mappend`
                    defaultContext

            makeItem ""
                >>= loadAndApplyTemplate "templates/paradise-list.html" archiveCtx
                >>= loadAndApplyTemplate "templates/default.html" archiveCtx
                >>= relativizeUrls

--------------------------------------------------------------------------------
--
postCtx :: Context String
postCtx =
    dateField "date" "%B %e, %Y" `mappend`
    defaultContext

--------------------------------------------------------------------------------
-- custom functions
--
blogDisplayName :: String
blogDisplayName = "Ramblingness Paradise"

myDisplayName :: String
myDisplayName = "Thiago Perrotta"

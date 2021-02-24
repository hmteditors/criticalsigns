# Run this script from the scripts directory
using Pkg
Pkg.activate(".")

using EditorsRepoPublisher
using CitableText

reporoot = dirname(pwd())
repoPublisher = publisher(reporoot)

textroot = reporoot * "/offline/texts/" 

aristonicus = CtsUrn("urn:cts:hmt:aristonicus.signs.msA:")
publish(repoPublisher, aristonicus, textroot)

harley = CtsUrn("urn:cts:hmt:harley5693.signs.hmt:")
publish(repoPublisher, harley, textroot)
#
# $FreeBSD$
#
# This include file <doc.docbook-dep.mk> handles implicit dependencies of
# DocBook documentation in the FreeBSD Documentation Project.
#

#
# extract the depending *.xml files from the main
# input sources on the fly:
#
# <!ENTITY release.building SYSTEM "./releng-building.xml">
#
DOCBOOK_DEP	!=  for i in $$(egrep '<!ENTITY [^ ]+ SYSTEM "[^ ]+\.xml">' ${SRCS} | sed -E 's,.*"([^"]+)".*,\1,');do if [ -e $$i ]; then echo $i; else echo "Warning: dep file $$(pwd)/$$i does not exists" >&2; fi; done

index.html ${DOC}.html: ${DOCBOOK_DEP}


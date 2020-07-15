#! /bin/bash -e

if [ -f "${1?}.env" ] ; then
  echo using legend
  cat $1.env
  docker run --env-file $1.env -i --rm --net=none microservicesio/plantuml:0.2.0.RELEASE < $1 > /tmp/foo.png
else
  echo not legend
  docker run -i --rm --net=none microservicesio/plantuml:0.2.0.RELEASE < $1 > /tmp/foo.png
fi

mv /tmp/foo.png ${2?}

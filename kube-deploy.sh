# get hash of current branch.
# assign above output to variable.
id = $(git rev-parse --short main)

echo "this is the git hash $id"
#cd into web and server to run command.

cd server

#Harbor
echo "running commands"
docker build -t gpac-viz/gridsight-server:$id .
docker image tag gpac-viz/gridsight-server:$id harbor.nrel.gov/gpac-viz/gridsight-server:$id
docker image push harbor.nrel.gov/gpac-viz/gridsight-server:$id

cd ..
cd web

#Harbor
docker build -t gpac-viz/gridsight-web:$id .
docker image tag gpac-viz/gridsight-web:$id harbor.nrel.gov/gpac-viz/gridsight-web:$id
docker image push harbor.nrel.gov/gpac-viz/gridsight-web:$id
cd $(dirname $0)

for dir in $(ls -d */); do
    echo ln -s $(pwd)/$dir $HOME/.config/$dir
done

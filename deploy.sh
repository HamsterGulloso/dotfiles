cd $(dirname $0)

for dir in $(ls -d */); do
    cmd="ln -s $(pwd)/$dir $HOME/.config/"
    echo $cmd
    $cmd
done

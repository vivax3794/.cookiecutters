rm -rfv builds/web
rm -fv builds/web.zip
mkdir builds/web

echo "BUILDING WEB"
cargo build --target wasm32-unknown-unknown --release
echo "GENERATING WEB BINDINGS"
wasm-bindgen --no-typescript --out-dir ./builds/web --target web ./target/wasm32-unknown-unknown/release/{{ cookiecutter.project_name }}.wasm
echo "OPTIMIZING WASM BUILD"
wasm-opt -O3 -o ./builds/web/{{ cookiecutter.project_name }}_bg.wasm ./builds/web/{{ cookiecutter.project_name }}_bg.wasm

echo "CREATING WEBAPGE"
cp -v scripts/index.html ./builds/web/
cp -rv assets builds/web
cd builds/web
zip -r ../web.zip *
cd ../..
rm -rfv builds/web
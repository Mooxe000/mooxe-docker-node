# yarn2

```
npm i -g yarn@berry

yarn set version berry # berry/latest/classic

yarn dlx @yarnpkg/pnpify --sdk vscode

# Press ctrl+shift+p in a TypeScript file

# Choose "Select TypeScript Version"

# Pick "Use Workspace Version"
```

# yarn2 create vite react app

```
yarn dlx create-vite-app --template react my-vite-react
```

yarn && vite

```
yarn
yarn dev
```

# yarn2 carete snowpack react app

```
yarn dlx create-snowpack-app --template @snowpack/app-template-react my-snowpack-react --use-yarn
```

# vite ts scss demo

https://github.com/JiangLiruii/vite-demo.git


# yarn swc

- yarn 1

```
yarn set version latest
yarn
npx swc ./src -d ./lib
npx spack
```

- yarn 2

```
yarn set version berry
yarn
yarn swc ./src -d ./lib
yarn spack
```

```
yarn bin
yarn exec echo Hello World
yarn plugin import exec
yarn dlx @yarnpkg/pnpify --sdk vscode
```

# yarn parcel

https://github.com/parcel-bundler/parcel/blob/v2/packages/configs/default/index.json

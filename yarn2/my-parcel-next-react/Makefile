yarn_version:
	yarn set version berry

yarn_install:
	yarn

yarn_vscode:
	yarn dlx @yarnpkg/pnpify --sdk vscode

yarn_all: yarn_version yarn_install yarn_vscode

dev_parcel:
	yarn parcel -p 3000 ./index.html --no-hmr

build_parcel:
	yarn parcel build ./index.html

serve_parcel:
	serve -p 3000 ./dist		

clean_before: yarn_version
	yarn add -D rimraf

clean:
	yarn rimraf ./dist ./.parcel-cache

clean_after:
	yarn rimraf ./.yarnrc.yml ./.pnp.js ./.yarn ./yarn.lock ./node_modules

clean_all: clean_before clean clean_after

cleanall: 
	rm -rf ./dist ./.parcel-cache ./.yarnrc.yml ./.pnp.js ./.yarn ./yarn.lock ./node_modules

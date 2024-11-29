local mason = require('mason-registry')
local jdtls_path = mason.get_package('jdtls'):get_install_path()
local equinox_launcher_path = vim.fn.glob(jdtls_path .. '/plugins/org.eclipse.equinox.launcher_*.jar')

-- Define system
local system = 'linux'
if vim.fn.has 'win32' then
	system = 'win'
elseif vim.fn.has 'mac' then
	system = 'mac'
end

local config_path = vim.fn.glob(jdtls_path .. '/config_' .. system)
local lombok_jar = vim.fn.stdpath('config') ..  '/plugins/jdtls/lombok.jar'

-- local jdtls_config = {
return {
	cmd = {
		'java',

		'-Declipse.application=org.eclipse.jdt.ls.core.id1',
		'-Dosgi.bundles.defaultStartLevel=4',
		'-Declipse.product=org.eclipse.jdt.ls.core.product',
		'-Dlog.protocol=true',
		'-Dlog.level=ALL',

		-- All below are not technically default configuration
		'-Dosgi.configuration.cascaded=true',
		'-Dosgi.checkConfiguration=true',
		-- '-Dosgi.sharedConfiguration.area=' .. jdtls_path .. 'config_linux',
		'-Dosgi.sharedConfiguration.area.readOnly=true',

		-- Allocation size
		'-Xms1G',
		-- '-Xms124M',
		'-Xmx524M',


		'--add-modules=ALL-SYSTEM',
		'--add-opens', 'java.base/java.util=ALL-UNNAMED',
		'--add-opens', 'java.base/java.lang=ALL-UNNAMED',

		-- '-javaagent:' .. lombok_jar,
		-- '-Xbootclasspath/a:' .. lombok_jar,
		-- '--jvm-arg=-javaagent:' .. lombok_jar,

		'-jar', equinox_launcher_path,
		'-configuration', config_path,
		'-data',
		vim.fn.stdpath 'cache'
			.. '/jdtls/'
			.. vim.fn.fnamemodify(vim.fn.getcwd(), ':t'),
	},

	-- 
	root_dir = vim.fs.root(0, { 'mvnw', 'gradlew' }),
	on_attach = require('gmr.configs.lsp').on_attach,

	-- Server settings
	settings = {
		java = {
			eclipse = {
				downloadSources = true
			},

			maven = {
				downloadSources = true
			}
		}
	}
}

-- require('jdtls').start_or_attach(jdtls_config)

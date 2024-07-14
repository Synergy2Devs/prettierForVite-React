#!/usr/bin/env node

const { spawn } = require('child_process')
const path = require('path')
const os = require('os')

const isWindows = os.platform() === 'win32'
const scriptPath = path.join(__dirname, 'prettier-vite-react.sh')

let child

if (isWindows) {
	// En Windows, usamos bash explícitamente y escapamos la ruta
	const escapedPath = scriptPath.replace(/\\/g, '/')
	child = spawn('bash', [escapedPath], { stdio: 'inherit', shell: true })
} else {
	// En Unix (Linux/macOS), ejecutamos el script directamente
	child = spawn(scriptPath, { stdio: 'inherit', shell: true })
}

child.on('exit', (code) => {
	process.exit(code)
})

import vue from '@vitejs/plugin-vue'
import vueJsx from '@vitejs/plugin-vue-jsx'
import path from 'path'
// import ts from 'rollup-plugin-typescript2'
import { defineConfig } from 'vite'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [
    vue(),
    vueJsx({
      // options are passed on to @vue/babel-plugin-jsx
    }),
  ],
  optimizeDeps: {
    // include: ['@ant-design/icons-vue'],
  },
  build: {
    lib: {
      entry: path.resolve(__dirname, 'lib/index.ts'),
      name: '@xsoulspace/vue-excel-initializer',
    },
    rollupOptions: {
      // make sure to externalize deps that shouldn't be bundled
      // into your library
      input: 'index.ts',
      external: ['vue'],
      plugins: [],
      output: {
        dir: './dist',
        // // Provide global variables to use in the UMD build
        // // for externalized deps
        globals: {
          vue: 'vue',
        },
      },
    },
  },
})

module.exports = {
  projects: ['<rootDir>/ts-packages/**/jest.config.js'],
  collectCoverageFrom: ['<rootDir>/ts-packages/**/*.spec.{ts,tsx}'],
  moduleDirectories: ['node_modules'],
  preset: 'ts-jest',
  transform: {
    '^.+\\.jsx?$': ['babel-jest'],
  },
}

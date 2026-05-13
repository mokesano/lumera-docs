import nextra from 'nextra'

/** @type {import('nextra').NextraConfig} */
const nextraConfig = {
  theme: 'nextra-theme-docs',
  themeConfig: './theme.config.jsx',
  defaultShowCopyCode: true,
};

/** @type {import('next').NextConfig} */
const nextConfig = {
  images: {
    unoptimized: true,
  },
  transpilePackages: ['nextra', 'nextra-theme-docs'],
};

const withNextra = nextra(nextraConfig)

export default withNextra(nextConfig);

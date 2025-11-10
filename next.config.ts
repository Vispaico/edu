import type { NextConfig } from "next"

const nextConfig: NextConfig = {
  images: {
    remotePatterns: [
      {
        protocol: "https",
        hostname: "images.unsplash.com",
      },
    ],
  },
  experimental: {
    outputFileTracingIncludes: {
      "/api/student-downloads/[file]": ["./templates/**/*"],
    },
  },
}

export default nextConfig

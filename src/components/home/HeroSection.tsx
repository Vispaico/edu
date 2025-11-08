import Link from "next/link"
import Image from "next/image"
import { BadgeCheck, Globe2, GraduationCap } from "lucide-react"

import { Button } from "@/components/ui/button"

const stats = [
  {
    label: "Students placed",
    value: "500+",
    icon: GraduationCap,
  },
  {
    label: "Visa success rate",
    value: "95%",
    icon: BadgeCheck,
  },
  {
    label: "Global partner campuses",
    value: "70+",
    icon: Globe2,
  },
]

export function HeroSection() {
  return (
    <section className="relative overflow-hidden bg-linear-to-b from-blue-50 via-white to-blue-100">
      <div
        aria-hidden="true"
        className="absolute -top-24 left-1/2 z-0 h-64 w-64 -translate-x-1/2 rounded-full bg-blue-200/50 blur-3xl"
      />
      <div
        aria-hidden="true"
        className="absolute -bottom-32 right-0 z-0 h-80 w-80 translate-x-1/3 rounded-full bg-sky-200/70 blur-3xl"
      />

      <div className="relative z-10 mx-auto flex w-full max-w-6xl flex-col-reverse gap-16 px-6 pb-28 pt-20 md:px-10 lg:flex-row lg:items-center lg:gap-12">
        <div className="flex w-full flex-1 flex-col gap-10 text-slate-900">
          <div className="space-y-6">
            <span className="inline-flex items-center gap-2 rounded-full bg-blue-100/60 px-4 py-2 text-sm font-medium text-blue-700 ring-1 ring-blue-200/70">
              Tailored Australian study pathways
            </span>
            <h1 className="text-pretty text-4xl font-bold leading-tight tracking-tight text-slate-900 sm:text-5xl xl:text-6xl">
              Design your
              <span className="relative mx-3 inline-flex">
                <span className="absolute inset-x-0 bottom-1 h-3 rounded-full bg-blue-200" aria-hidden="true" />
                <span className="relative bg-linear-to-r from-blue-600 to-sky-500 bg-clip-text text-transparent">
                  global education
                </span>
              </span>
              journey with experts who care.
            </h1>
            <p className="max-w-2xl text-lg text-slate-600 sm:text-xl">
              Our dedicated advisors mentor you from course selection to visa approval, ensuring a confident transition into top Australian universities.
            </p>
          </div>

          <div className="flex flex-col gap-4 sm:flex-row sm:items-center">
            <Button
              size="lg"
              className="h-12 rounded-full px-7 text-base font-semibold shadow-lg shadow-blue-500/10 transition-transform duration-200 hover:-translate-y-0.5 hover:shadow-blue-500/20"
              asChild
            >
              <Link href="/register">Start for Free</Link>
            </Button>
            <Button
              size="lg"
              variant="outline"
              className="h-12 rounded-full border-blue-300 bg-white/70 px-7 text-base font-semibold text-blue-700 transition-transform duration-200 hover:-translate-y-0.5 hover:bg-white"
              asChild
            >
              <Link href="/universities">Explore Universities</Link>
            </Button>
          </div>

          <div className="flex flex-wrap gap-6">
            {stats.map((stat) => {
              const Icon = stat.icon
              return (
                <div
                  key={stat.label}
                  className="flex min-w-56 flex-1 items-center gap-4 rounded-2xl bg-white/80 p-4 shadow-sm ring-1 ring-white/40 backdrop-blur"
                >
                  <div className="flex size-12 items-center justify-center rounded-full bg-blue-600/10 text-blue-700">
                    <Icon aria-hidden className="size-6" />
                  </div>
                  <div>
                    <div className="text-2xl font-semibold text-blue-700">{stat.value}</div>
                    <p className="text-sm font-medium text-slate-500">{stat.label}</p>
                  </div>
                </div>
              )
            })}
          </div>
        </div>

        <div className="relative flex flex-1 items-center justify-center">
          <div
            aria-hidden="true"
            className="absolute -left-10 top-12 h-72 w-72 rounded-full bg-sky-100/70 blur-3xl lg:-left-16"
          />
          <div className="relative w-full max-w-md overflow-hidden rounded-3xl border border-white/40 bg-white/80 p-6 shadow-2xl ring-1 ring-blue-100/70 backdrop-blur">
            {/* Replace illustration with brand-specific artwork when available. */}
            <Image
              alt="Student journey illustration"
              src="/images/hero-student-journey.svg"
              width={520}
              height={420}
              priority
              className="size-full object-contain"
            />
          </div>
        </div>
      </div>

      <svg
        aria-hidden="true"
        className="absolute bottom-0 left-0 w-full text-blue-200"
        viewBox="0 0 1440 160"
        xmlns="http://www.w3.org/2000/svg"
      >
        <path
          d="M0 80L60 88C120 96 240 112 360 109.3C480 107 600 85 720 82.7C840 80 960 96 1080 104C1200 112 1320 112 1380 112L1440 112V160H1380C1320 160 1200 160 1080 160C960 160 840 160 720 160C600 160 480 160 360 160C240 160 120 160 60 160H0V80Z"
          fill="currentColor"
        />
      </svg>
    </section>
  )
}

export default HeroSection

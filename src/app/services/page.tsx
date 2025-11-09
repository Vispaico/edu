import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { servicesList } from '@/data/services'
import Link from 'next/link'

export default function ServicesPage() {
  return (
    <div className="min-h-screen bg-gray-50">
      {/* Hero Section */}
      <section className="bg-white py-16">
        <div className="container mx-auto px-4">
          <div className="mx-auto max-w-4xl text-center">
            <h1 className="mb-4 text-4xl font-bold text-gray-900 md:text-5xl">
              Our Services
            </h1>
            <p className="text-lg text-gray-600 md:text-xl">
              Comprehensive support for every step of your study abroad journey
            </p>
          </div>
        </div>
      </section>

      {/* Services Grid */}
      <section className="py-16">
        <div className="container mx-auto px-4">
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 max-w-6xl mx-auto">
            {servicesList.map((service) => {
              const href = `/services/${service.slug}`
              return (
                <Card key={service.slug} className="h-full">
                <CardHeader>
                  <div className="text-4xl mb-2">{service.emoji}</div>
                  <CardTitle>{service.title}</CardTitle>
                  <CardDescription>{service.description}</CardDescription>
                </CardHeader>
                <CardContent>
                  <ul className="space-y-2">
                    {service.features.map((feature, idx) => (
                      <li key={idx} className="flex items-start gap-2 text-sm">
                        <span className="text-green-600 mt-1">✓</span>
                        <span>{feature}</span>
                      </li>
                    ))}
                  </ul>
                    <Button
                      asChild
                      size="lg"
                      className="mt-6 w-full rounded-full font-semibold"
                    >
                      <Link href={href}>Explore {service.title}</Link>
                    </Button>
                </CardContent>
                </Card>
              )
            })}
          </div>
        </div>
      </section>

      {/* CTA Section */}
      <section className="py-16 bg-white">
        <div className="container mx-auto px-4 text-center">
          <h2 className="text-3xl font-bold mb-4">Ready to Get Started?</h2>
          <p className="text-gray-600 mb-8 max-w-2xl mx-auto">
            Schedule a free consultation with our expert advisors
          </p>
          <Button
            size="lg"
            className="h-12 rounded-full px-8 text-base font-semibold shadow-lg shadow-blue-500/20 transition-transform duration-200 hover:-translate-y-0.5"
            asChild
          >
            <Link href="/contact">Book Free Consultation</Link>
          </Button>
        </div>
      </section>
    </div>
  )
}

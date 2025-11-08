import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import Link from 'next/link'

const services = [
  {
    icon: '🎓',
    title: 'University Selection',
    description: 'Expert guidance to choose the right university and program matching your goals, budget, and career aspirations.',
    features: [
      'Personalized university recommendations',
      'Program comparison and analysis',
      'Career outcome insights',
      'Scholarship opportunities'
    ]
  },
  {
    icon: '📝',
    title: 'Application Support',
    description: 'Complete assistance with university applications, from document preparation to submission.',
    features: [
      'Application form completion',
      'Document verification',
      'Statement of Purpose editing',
      'Recommendation letter guidance'
    ]
  },
  {
    icon: '✈️',
    title: 'Visa Processing',
    description: 'Step-by-step support for Australian student visa (Subclass 500) with high success rate.',
    features: [
      'Visa eligibility assessment',
      'Document preparation',
      'Application lodgement',
      'Interview preparation'
    ]
  },
  {
    icon: '📚',
    title: 'Test Preparation',
    description: 'IELTS, TOEFL, and PTE test booking assistance and preparation resources.',
    features: [
      'Test center booking',
      'Study materials',
      'Practice tests',
      'Score improvement tips'
    ]
  },
  {
    icon: '💼',
    title: 'Career Counseling',
    description: 'Professional advice on career paths and job prospects in Australia.',
    features: [
      'Industry insights',
      'Job market analysis',
      'Resume building',
      'Interview preparation'
    ]
  },
  {
    icon: '🏠',
    title: 'Pre-Departure Support',
    description: 'Accommodation, travel, and settlement assistance for your move to Australia.',
    features: [
      'Accommodation booking',
      'Airport pickup arrangement',
      'Bank account setup',
      'Orientation sessions'
    ]
  }
]

export default function ServicesPage() {
  return (
    <div className="min-h-screen bg-gray-50">
      {/* Hero Section */}
      <section className="bg-gradient-to-b from-blue-600 to-blue-700 text-white py-20">
        <div className="container mx-auto px-4 text-center">
          <h1 className="text-4xl md:text-5xl font-bold mb-4">
            Our Services
          </h1>
          <p className="text-xl text-blue-100 max-w-2xl mx-auto">
            Comprehensive support for every step of your study abroad journey
          </p>
        </div>
      </section>

      {/* Services Grid */}
      <section className="py-16">
        <div className="container mx-auto px-4">
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 max-w-6xl mx-auto">
            {services.map((service, index) => (
              <Card key={index} className="h-full">
                <CardHeader>
                  <div className="text-4xl mb-2">{service.icon}</div>
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
                </CardContent>
              </Card>
            ))}
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
          <Button size="lg" asChild>
            <Link href="/contact">Book Free Consultation</Link>
          </Button>
        </div>
      </section>
    </div>
  )
}

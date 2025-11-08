import Link from 'next/link'
import { Button } from '@/components/ui/button'

export default function HomePage() {
  return (
    <main className="min-h-screen">
      {/* Hero Section */}
      <section className="relative bg-gradient-to-b from-blue-50 to-white py-20">
        <div className="container mx-auto px-4">
          <div className="max-w-4xl mx-auto text-center">
            <h1 className="text-5xl font-bold text-gray-900 mb-6">
              Your Journey to Study in Australia Starts Here
            </h1>
            <p className="text-xl text-gray-600 mb-8">
              Professional education consultancy helping Vietnamese students achieve their dreams
              of studying at top Australian universities.
            </p>
            <div className="flex gap-4 justify-center">
              <Button size="lg" asChild>
                <Link href="/register">Get Started Free</Link>
              </Button>
              <Button size="lg" variant="outline" asChild>
                <Link href="/universities">Browse Universities</Link>
              </Button>
            </div>
          </div>
        </div>
      </section>

      {/* Stats Section */}
      <section className="py-16 bg-white">
        <div className="container mx-auto px-4">
          <div className="grid grid-cols-1 md:grid-cols-4 gap-8 text-center">
            <div>
              <div className="text-4xl font-bold text-blue-600 mb-2">500+</div>
              <div className="text-gray-600">Students Placed</div>
            </div>
            <div>
              <div className="text-4xl font-bold text-blue-600 mb-2">50+</div>
              <div className="text-gray-600">Partner Universities</div>
            </div>
            <div>
              <div className="text-4xl font-bold text-blue-600 mb-2">95%</div>
              <div className="text-gray-600">Visa Success Rate</div>
            </div>
            <div>
              <div className="text-4xl font-bold text-blue-600 mb-2">10+</div>
              <div className="text-gray-600">Years Experience</div>
            </div>
          </div>
        </div>
      </section>

      {/* Services Section */}
      <section className="py-16 bg-gray-50">
        <div className="container mx-auto px-4">
          <div className="text-center mb-12">
            <h2 className="text-3xl font-bold text-gray-900 mb-4">Our Services</h2>
            <p className="text-gray-600">Comprehensive support for your study abroad journey</p>
          </div>
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            {services.map((service, index) => (
              <div key={index} className="bg-white p-6 rounded-lg shadow-sm">
                <div className="text-blue-600 mb-4">{service.icon}</div>
                <h3 className="text-xl font-semibold mb-2">{service.title}</h3>
                <p className="text-gray-600">{service.description}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* CTA Section */}
      <section className="py-20 bg-blue-600">
        <div className="container mx-auto px-4 text-center">
          <h2 className="text-3xl font-bold text-white mb-4">
            Ready to Start Your Journey?
          </h2>
          <p className="text-blue-100 mb-8 max-w-2xl mx-auto">
            Join hundreds of Vietnamese students who have successfully enrolled in top
            Australian universities with our help.
          </p>
          <Button size="lg" variant="secondary" asChild>
            <Link href="/register">Create Free Account</Link>
          </Button>
        </div>
      </section>
    </main>
  )
}

const services = [
  {
    icon: '🎓',
    title: 'University Selection',
    description: 'Expert guidance to choose the right university and program for your goals'
  },
  {
    icon: '📝',
    title: 'Application Support',
    description: 'Complete assistance with university applications and documentation'
  },
  {
    icon: '✈️',
    title: 'Visa Processing',
    description: 'Step-by-step support for Australian student visa (Subclass 500)'
  },
  {
    icon: '📚',
    title: 'Test Preparation',
    description: 'IELTS, TOEFL, and PTE test booking and preparation resources'
  },
  {
    icon: '💼',
    title: 'Career Counseling',
    description: 'Professional advice on career paths and job prospects in Australia'
  },
  {
    icon: '🏠',
    title: 'Pre-Departure',
    description: 'Accommodation, travel, and settlement support for your move to Australia'
  }
]

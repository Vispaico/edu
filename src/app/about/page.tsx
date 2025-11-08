import { Card, CardContent } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import Link from 'next/link'

export default function AboutPage() {
  return (
    <div className="min-h-screen bg-gray-50">
      {/* Hero */}
      <section className="bg-gradient-to-b from-blue-600 to-blue-700 text-white py-20">
        <div className="container mx-auto px-4 text-center">
          <h1 className="text-4xl md:text-5xl font-bold mb-4">About Us</h1>
          <p className="text-xl text-blue-100 max-w-2xl mx-auto">
            Your trusted partner for studying in Australia since 2014
          </p>
        </div>
      </section>

      {/* Our Story */}
      <section className="py-16">
        <div className="container mx-auto px-4 max-w-4xl">
          <h2 className="text-3xl font-bold text-center mb-8">Our Story</h2>
          <div className="prose prose-lg mx-auto text-gray-600">
            <p>
              Founded in 2014, Edu Consultancy has helped over 500 Vietnamese students
              achieve their dream of studying at top Australian universities. Our team
              of experienced education consultants understands the unique challenges
              Vietnamese students face and provides personalized support throughout
              the entire process.
            </p>
            <p>
              We maintain strong partnerships with over 50 Australian universities
              and have achieved a 95% visa success rate. Our commitment to excellence
              and personalized service has made us one of the most trusted education
              consultancies in Vietnam.
            </p>
          </div>
        </div>
      </section>

      {/* Stats */}
      <section className="py-16 bg-white">
        <div className="container mx-auto px-4">
          <div className="grid grid-cols-2 md:grid-cols-4 gap-8 max-w-4xl mx-auto text-center">
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

      {/* Team */}
      <section className="py-16">
        <div className="container mx-auto px-4">
          <h2 className="text-3xl font-bold text-center mb-12">Our Team</h2>
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8 max-w-4xl mx-auto">
            {[
              { name: 'Nguyen Van A', role: 'Founder & CEO', exp: '15 years experience' },
              { name: 'Tran Thi B', role: 'Senior Consultant', exp: '10 years experience' },
              { name: 'Le Van C', role: 'Visa Specialist', exp: '8 years experience' }
            ].map((member, idx) => (
              <Card key={idx}>
                <CardContent className="pt-6 text-center">
                  <div className="w-24 h-24 bg-blue-100 rounded-full mx-auto mb-4" />
                  <h3 className="font-semibold text-lg">{member.name}</h3>
                  <p className="text-gray-600 text-sm">{member.role}</p>
                  <p className="text-gray-500 text-xs mt-1">{member.exp}</p>
                </CardContent>
              </Card>
            ))}
          </div>
        </div>
      </section>

      {/* CTA */}
      <section className="py-16 bg-blue-600 text-white">
        <div className="container mx-auto px-4 text-center">
          <h2 className="text-3xl font-bold mb-4">Start Your Journey Today</h2>
          <p className="mb-8 max-w-2xl mx-auto">
            Let us help you achieve your dream of studying in Australia
          </p>
          <Button size="lg" variant="secondary" asChild>
            <Link href="/contact">Contact Us</Link>
          </Button>
        </div>
      </section>
    </div>
  )
}

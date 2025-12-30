const HeroSection = () => {
  return (
    <div className="flex-1">
      <div className="relative flex min-h-screen items-center justify-center overflow-hidden h-32 bg-linear-to-r from-blue-600 to-blue-400">
        {/* Decorative Background Elements */}
        <div className="absolute inset-0 overflow-hidden">
          <div className="absolute left-1/4 top-1/4 h-96 w-96 rounded-full bg-linear-to-br from-brand-purple-light/30 to-brand-purple/20 blur-3xl" />
          <div className="absolute bottom-1/4 right-1/4 h-96 w-96 rounded-full bg-linear-to-br from-brand-purple/20 to-brand-purple-dark/30 blur-3xl" />
        </div>

        {/* Hero Content */}
        <div className="relative z-10 flex max-w-2xl flex-col items-center px-8 text-center">
          {/* Icon/Badge */}
          <div className="mb-8 flex h-28 w-28 items-center justify-center rounded-3xl bg-linear-to-br from-brand-purple-light to-brand-purple-dark p-1 shadow-2xl border-4 border-blue-300">
            <div className="flex h-full w-full items-center justify-center rounded-3xl bg-background border-4 border-blue-300 shadow-lg">
              <svg
                className="h-14 w-14 text-brand-purple"
                fill="none"
                viewBox="0 0 24 24"
                stroke="currentColor"
              >
                <path
                  strokeLinecap="round"
                  strokeLinejoin="round"
                  strokeWidth={1.5}
                  d="M9 7h6m0 10v-3m-3 3h.01M9 17h.01M9 14h.01M12 14h.01M15 11h.01M12 11h.01M9 11h.01M7 21h10a2 2 0 002-2V5a2 2 0 00-2-2H7a2 2 0 00-2 2v14a2 2 0 002 2z"
                />
              </svg>
            </div>
          </div>

          {/* Heading */}
          <h1 className="mb-6 text-balance text-5xl font-bold leading-tight tracking-tight">
            <span className="text-foreground">Master Math with</span>
            <br />
            <span className="bg-linear-to-r from-brand-purple-light via-brand-purple to-brand-purple-dark bg-clip-text text-[rgba(166,198,237,1)]">
              Interactive Worksheets
            </span>
          </h1>

          {/* Description */}
          <p className="mb-10 max-w-xl text-pretty text-lg text-black">
            Select a topic and category to view printable worksheets. Build
            confidence and skills through practice with our comprehensive
            collection of math exercises.
          </p>

          {/* CTA Button */}
          <button className="group relative overflow-hidden rounded-xl bg-blue-200 px-8 py-4 font-semibold text-white shadow-lg transition-all hover:scale-105 hover:shadow-xl hover:bg-blue-300">
            <span className="relative z-10 text-black">Get Started</span>
          </button>

          {/* Features Grid */}
          <div className="mt-16 grid grid-cols-3 gap-6">
            <div className="rounded-2xl border border-brand-purple/20 bg-background/80 p-6 backdrop-blur-sm">
              <div className="mb-3 flex h-12 w-12 items-center justify-center rounded-xl bg-brand-purple/10">
                <svg
                  className="h-6 w-6 text-brand-purple"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
                >
                  <path
                    strokeLinecap="round"
                    strokeLinejoin="round"
                    strokeWidth={2}
                    d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"
                  />
                </svg>
              </div>
              <h3 className="mb-2 font-semibold text-foreground">
                Easy to Use
              </h3>
              <p className="text-sm text-muted-foreground">
                Simple navigation and instant access
              </p>
            </div>

            <div className="rounded-2xl border border-brand-orange/20 bg-background/80 p-6 backdrop-blur-sm">
              <div className="mb-3 flex h-12 w-12 items-center justify-center rounded-xl bg-brand-orange/10">
                <svg
                  className="h-6 w-6 text-brand-orange"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
                >
                  <path
                    strokeLinecap="round"
                    strokeLinejoin="round"
                    strokeWidth={2}
                    d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253"
                  />
                </svg>
              </div>
              <h3 className="mb-2 font-semibold text-foreground">
                Comprehensive
              </h3>
              <p className="text-sm text-muted-foreground">
                Wide range of topics covered
              </p>
            </div>

            <div className="rounded-2xl border border-brand-purple/20 bg-background/80 p-6 backdrop-blur-sm">
              <div className="mb-3 flex h-12 w-12 items-center justify-center rounded-xl bg-gradient-to-br from-brand-purple-light/10 to-brand-purple-dark/10">
                <svg
                  className="h-6 w-6 text-brand-purple"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
                >
                  <path
                    strokeLinecap="round"
                    strokeLinejoin="round"
                    strokeWidth={2}
                    d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"
                  />
                </svg>
              </div>
              <h3 className="mb-2 font-semibold text-foreground">Printable</h3>
              <p className="text-sm text-muted-foreground">
                Download and print anytime
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default HeroSection;

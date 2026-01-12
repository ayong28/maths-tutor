const HeroSection = () => {
  return (
    <div className="flex-1">
      <div className="relative flex min-h-[60vh] items-center justify-center overflow-hidden bg-linear-to-r from-blue-600 to-blue-400">
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
            <span className=" text-amber-400">
              Year 7 Math Worksheets
            </span>
          </h1>

          {/* Description */}
          <p className="mb-10 max-w-xl text-pretty text-lg text-black">
            Select a topic and category to view printable worksheets. Build
            confidence and skills through practice with our comprehensive
            collection of math exercises.
          </p>

        </div>
      </div>
    </div>
  );
};

export default HeroSection;

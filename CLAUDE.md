
# CLAUDE.md — Glasscast

You are assisting in building a production-quality iOS app.

## App Overview
Glasscast is a minimal weather app built using SwiftUI and iOS 26 Liquid Glass APIs.

## Tech Stack
- SwiftUI (iOS 26+)
- Liquid Glass (.glassEffect, GlassEffectContainer)
- MVVM architecture
- Swift Concurrency (async/await)
- Supabase (Auth + Database)
- OpenWeatherMap API

## Architecture Rules
- Follow strict MVVM
- Views must not contain networking logic
- ViewModels must be marked @MainActor
- Use Services for API and database access
- Prefer dependency injection
- Avoid singletons

## UI Rules
- Use glass-based containers for cards and navigation
- Clean spacing and typography
- Subtle animations only
- Support dark mode

## Security Rules
- Never hardcode API keys or secrets
- Read secrets from Info.plist or environment variables
- Assume Supabase RLS is enabled

## Error Handling
- Handle loading, empty, and error states explicitly
- No force unwraps in production code

## AI Behavior
- Explain reasoning before writing large blocks of code
- Prefer clarity over clever solutions
- Ask questions if requirements are unclear

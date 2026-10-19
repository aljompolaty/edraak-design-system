/** Edraak Engineering — tailwind.config.js (v1.3.0) */
module.exports = {
  content: ['./**/*.{html,jsx,tsx}'],
  theme: {
    extend: {
      colors: {
        bg: 'var(--bg)', surface: 'var(--surface)', text: 'var(--text)', 'text-2': 'var(--text2)',
        border: 'var(--border)', action: 'var(--action)', 'on-action': 'var(--onaction)',
        accent: 'var(--accent)', focus: 'var(--focus)', error: 'var(--error)',
        brand: { navy: '#112C46', orange: '#ED6725', 'navy-950': '#0B1D2E' },
      },
      fontFamily: {
        sans: ['Thmanyah Sans', 'Noto Sans Arabic', 'system-ui', 'sans-serif'],
        serif: ['Thmanyah Serif Display', 'Georgia', 'serif'],
      },
      borderRadius: { sm: '4px', md: '8px', lg: '12px' },
      spacing: { 1: '4px', 2: '8px', 3: '12px', 4: '16px', 6: '24px', 8: '32px', 12: '48px', 16: '64px', 24: '96px' },
      boxShadow: { 1: '0 1px 2px rgba(17,44,70,.08)', 2: '0 6px 16px rgba(17,44,70,.12)', 3: '0 16px 40px rgba(17,44,70,.18)' },
    },
  },
};

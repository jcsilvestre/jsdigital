 import '@/app/styles/globals.css'; // caminho relativo
import { Providers } from './providers';

 
export const metadata = {
  title: 'JS Digital SaaS',
  description: 'Plataforma SaaS Multi-Tenant',
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="pt-BR">
      <body>
        <Providers>{children}</Providers>
      </body>
    </html>
  );
}

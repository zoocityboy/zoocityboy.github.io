import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class HeroBanner extends StatelessComponent {
  const HeroBanner({super.key});

  @override
  Component build(BuildContext context) {
    return div(
      [
        div(classes: 'mx-auto w-full max-w-5xl px-6 pb-24 pt-10 md:px-8', [
          section(classes: 'grid gap-10 pb-20 pt-10 lg:grid-cols-[1.1fr_0.9fr] lg:items-center', [
            div(classes: 'gap-10', [
              div(classes: 'space-y-5', [
                const HeroAsciiText(),
              ]),
              p(
                classes: 'pb-kicker inline-flex items-center border bg-secondary px-3 py-1',
                [.text('Context for user')],
              ),
              h1(classes: 'max-w-[18ch] text-4xl font-semibold leading-tight tracking-tighter md:text-6xl', [
                .text('Dart developer*'),
                br(),
                span(classes: 'text-2xl md:text-4xl text-muted-foreground', [.text('Flutter, Jaspr, Nocterm.')]),
              ]),
            ]),
          ]),
        ]),
      ],
    );
  }
}

class HeroAsciiText extends StatelessComponent {
  const HeroAsciiText({super.key});

  @override
  Component build(BuildContext context) {
    return div([
      pre(
        classes:
            'hidden md:inline-flex pb-kicker items-center py-1 w-full max-w-full overflow-x-auto whitespace-pre text-[clamp(8px,3vw,12px)] leading-tight font-mono',
        [
          .text(r'''


 /$$$$$$$$  /$$$$$$   /$$$$$$   /$$$$$$  /$$$$$$ /$$$$$$$$ /$$     /$$ /$$$$$$$   /$$$$$$  /$$     /$$
|_____ $$  /$$__  $$ /$$__  $$ /$$__  $$|_  $$_/|__  $$__/|  $$   /$$/| $$__  $$ /$$__  $$|  $$   /$$/
     /$$/ | $$  \ $$| $$  \ $$| $$  \__/  | $$     | $$    \  $$ /$$/ | $$  \ $$| $$  \ $$ \  $$ /$$/ 
    /$$/  | $$  | $$| $$  | $$| $$        | $$     | $$     \  $$$$/  | $$$$$$$ | $$  | $$  \  $$$$/  
   /$$/   | $$  | $$| $$  | $$| $$        | $$     | $$      \  $$/   | $$__  $$| $$  | $$   \  $$/   
  /$$/    | $$  | $$| $$  | $$| $$    $$  | $$     | $$       | $$    | $$  \ $$| $$  | $$    | $$    
 /$$$$$$$$|  $$$$$$/|  $$$$$$/|  $$$$$$/ /$$$$$$   | $$       | $$    | $$$$$$$/|  $$$$$$/    | $$    
|________/ \______/  \______/  \______/ |______/   |__/       |__/    |_______/  \______/     |__/    


'''),
        ],
      ),
      pre(
        classes:
            'md:hidden pb-kicker items-center py-1 w-full max-w-full overflow-x-auto whitespace-pre text-[clamp(8px,3vw,12px)] leading-tight font-mono',
        [
          .text(r'''


 /$$$$$$$$  /$$$$$$   /$$$$$$ 
|_____ $$  /$$__  $$ /$$__  $$
     /$$/ | $$  \ $$| $$  \ $$
    /$$/  | $$  | $$| $$  | $$
   /$$/   | $$  | $$| $$  | $$
  /$$/    | $$  | $$| $$  | $$
 /$$$$$$$$|  $$$$$$/|  $$$$$$/
|________/ \______/  \______/ 
  /$$$$$$  /$$$$$$ /$$$$$$$$ /$$     /$$
 /$$__  $$|_  $$_/|__  $$__/|  $$   /$$/
| $$  \__/  | $$     | $$    \  $$ /$$/ 
| $$        | $$     | $$     \  $$$$/  
| $$        | $$     | $$      \  $$/   
| $$    $$  | $$     | $$       | $$    
|  $$$$$$/ /$$$$$$   | $$       | $$    
 \______/ |______/   |__/       |__/    
 /$$$$$$$   /$$$$$$  /$$     /$$ 
| $$__  $$ /$$__  $$|  $$   /$$/ 
| $$  \ $$| $$  \ $$ \  $$ /$$/   
| $$$$$$$ | $$  | $$  \  $$$$/  
| $$__  $$| $$  | $$   \  $$/   
| $$  \ $$| $$  | $$    | $$    
| $$$$$$$/|  $$$$$$/    | $$    
|_______/  \______/     |__/
'''),
        ],
      ),
    ]);
  }
}

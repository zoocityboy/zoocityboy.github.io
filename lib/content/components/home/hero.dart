import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class HeroComponent extends StatelessComponent {
  const HeroComponent({super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: 'grid gap-10 pb-20 pt-10 lg:grid-cols-[1.1fr_0.9fr] lg:items-center', [
      div(classes: 'space-y-5', [
        p(
          classes: 'pb-kicker inline-flex items-center border bg-secondary px-3 py-1',
          [.text('Context for user')],
        ),
        h1(classes: 'max-w-[18ch] text-4xl font-semibold leading-tight tracking-tighter md:text-6xl', [
          .text('Dart developer.'),
          span(classes: 'text-base', [.text('Flutter, Jaspr, Nocterm.')]),
        ]),
        p(classes: 'max-w-[56ch] text-sm leading-7 text-muted-foreground md:text-base', [
          .text(
            'Zoocityboy is a software developer and open source enthusiast who loves building tools that empower other developers. This site is a collection of his work, including packages, blog posts, and projects.',
          ),
        ]),
        div(classes: 'flex flex-wrap gap-2.5', [
          a(
            href: '#directory',
            classes: 'pb-button-primary',
            [.text('Browse skills')],
          ),
          a(
            href: '#faq',
            classes: 'pb-button-secondary',
            [.text('Read common questions')],
          ),
        ]),
      ]),
      div(classes: 'pb-card p-6 md:p-7', [
        p(classes: 'pb-kicker', [
          .text('Works with these tools'),
        ]),
        ul(classes: 'mt-4 grid grid-cols-2 gap-2.5 text-sm font-medium text-card-foreground md:grid-cols-3', [
          li([.text('#dartlang')]),
          li([.text('#flutter')]),
          li([.text('#vscode')]),
          li([.text('#jaspr')]),
          li([.text('#nocterm')]),
          li([.text('#github')]),
        ]),
      ]),
    ]);
  }
}

class HeroBanner extends StatelessComponent {
  const HeroBanner({super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: 'grid gap-10 pb-20 pt-10 lg:grid-cols-[1.1fr_0.9fr] lg:items-center', [
      div(classes: 'space-y-10 gap-10 pb-20', [
        const HeroAsciiText(),
        h1(classes: 'max-w-[18ch] text-4xl font-semibold leading-tight tracking-tighter md:text-6xl', [
          .text('Dart developer*'),
          br(),
          span(classes: 'text-2xl md:text-4xl text-muted-foreground', [.text('Flutter, Jaspr, Nocterm.')]),
        ]),
        p(
          classes: 'pb-kicker inline-flex items-center border bg-secondary px-3 py-1',
          [.text('Context for user')],
        ),
        p(classes: 'max-w-[56ch] text-sm leading-7 text-muted-foreground md:text-base', [
          .text(
            'Zoocityboy is a software developer and open source enthusiast who loves building tools that empower other developers. This site is a collection of his work, including packages, blog posts, and projects.',
          ),
        ]),
      ]),
    ]);
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

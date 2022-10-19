//---------//
// IMPORTS //
//---------//

local bundle = import 'lib/bundle.libsonnet';
local file_paths = import 'lib/file_paths.libsonnet';
local k = import 'lib/karabiner.libsonnet';


//------//
// MAIN //
//------//

{
  title: 'Windows Shortcuts',
  rules: [
    k.rule('[IDEs] Copy (ctrl+c -> cmd+c)',
      k.input('c', ['control']),
      k.outputKey('c', ['command']),
      k.frontmost_application_if(bundle.ides)),
    k.rule('[IDEs] Paste (ctrl+v -> cmd+v)',
      k.input('v', ['control']),
      k.outputKey('v', ['command']),
      k.frontmost_application_if(bundle.ides)),
    k.rule('[IDEs] Cut (ctrl+x -> cmd+x)',
      k.input('x', ['control']),
      k.outputKey('x', ['command']),
      k.frontmost_application_if(bundle.ides)),
    k.rule('[IDEs] Save (ctrl+s -> cmd+s)',
      k.input('s', ['control']),
      k.outputKey('s', ['command']),
      k.frontmost_application_if(bundle.ides)),
    k.rule('[IDEs] Undo (ctrl+z -> cmd+z)',
      k.input('z', ['control']),
      k.outputKey('z', ['command']),
      k.frontmost_application_if(bundle.ides)),
    k.rule('[IDEs] Redo (ctrl+y -> cmd+shift+y)',
      k.input('y', ['control']),
      k.outputKey('y', ['command', 'shift']),
      k.frontmost_application_if(bundle.ides)),
    k.rule('[IDEs] Select All (ctrl+a -> cmd+a)',
      k.input('a', ['control']),
      k.outputKey('a', ['command']),
      k.frontmost_application_if(bundle.ides)),
    k.rule('[IDEs] Find (ctrl+f -> cmd+f)',
      k.input('f', ['control']),
      k.outputKey('f', ['command']),
      k.frontmost_application_if(bundle.ides)),
    k.rule('[IDEs + Browsers] Close (ctrl+w -> cmd+w)',
      k.input('w', ['control']),
      k.outputKey('w', ['command']),
      k.frontmost_application_if(bundle.ides + bundle.webBrowsers)),

    // Web Browsers
    k.rule('[Browsers] New Tab (ctrl+t -> cmd+t)',
      k.input('t', ['control']),
      k.outputKey('t', ['command']),
      k.frontmost_application_if(bundle.webBrowsers)),
    k.rule('[Browsers] Reload (ctrl+r -> cmd+r)',
      k.input('r', ['control']),
      k.outputKey('r', ['command']),
      k.frontmost_application_if(bundle.webBrowsers)),
    k.rule('[Browsers] Reload (F5 -> cmd+r)',
      k.input('F5'),
      k.outputKey('r', ['command']),
      k.frontmost_application_if(bundle.webBrowsers)),
    
    
    // Global
    k.rule('[Global] Quit (alt+F4 -> cmd+q)',
      k.input('F4', ['option']),
      k.outputKey('q', ['command'])),
    k.rule('[Global] Lock Screen (cmd+l -> cmd+alt+q)',
      k.input('l', ['command']),
      k.outputKey('q', ['control', 'command'])),
    k.rule('[Global] Open Launchpad (ctrl+esc)', // Unsure of this one
      k.input('escape', ['control']),
      k.outputKey('launchpad')),
    // k.rule('[Global] Select Multiple (ctrl+left click -> cmd+left click)', // Not working currently
    //   k.mouse_button('button1', ['control']),
    //   k.outputKey('button1', ['command'], 'to', 'pointing_button')),

    // Movement and selection
    k.rule('[Movement] Move cursor to beginning of line (with selection) ((shift)+home -> cmd+(shift)+left)',
      k.input('home', {mandatory: [], optional: ['shift']}),
      k.outputKey('left_arrow', ['command'])),
    k.rule('[Movement] Move cursor to beginning of file (with selection) (ctrl+(shift)+home -> cmd+(shift)+up)',
      k.input('home', {mandatory: ['control'], optional: ['shift']}),
      k.outputKey('up_arrow', ['command'])),
    k.rule('[Movement] Move cursor to end of file (with selection) (ctrl+(shift)+end -> cmd+(shift)+down)',
      k.input('end', {mandatory: ['control'], optional: ['shift']}),
      k.outputKey('down', ['command'])),
    k.rule('[Movement] Move cursor to end of line (with selection) ((shift)+end -> cmd+(shift)+right)',
      k.input('end', {mandatory: [], optional: ['shift']}),
      k.outputKey('right_arrow', ['command'])),
    k.rule('[Movement] Move cursor (with selection) one word to the right (ctrl+(shift)+right -> alt+(shift)+right)',
      k.input('right_arrow', {mandatory: ['control'], optional: ['shift']}),
      k.outputKey('right_arrow', ['option'])),
    k.rule('[Movement] Move cursor (with selection) one word to the left (ctrl+(shift)+left -> alt+(shift)+left)',
      k.input('left_arrow', {mandatory: ['control'], optional: ['shift']}),
      k.outputKey('left_arrow', ['option'])),
    k.rule('[Movement] Delete whole word behind (ctrl+backspace -> alt+backspace)',
      k.input('delete_or_backspace', ['control']),
      k.outputKey('delete_or_backspace', ['option'])),
    k.rule('[Movement] Delete whole word ahead (ctrl+delete -> alt+del)',
      k.input('delete_forward', ['control']),
      k.outputKey('delete_forward', ['option'])),
    k.rule('[Selection] Select All (ctrl+a -> cmd+a)',
      k.input('a', ['control']),
      k.outputKey('a', ['command'])),

    // Terminal emulator helpers
    k.rule('[Terminal Emulators] Paste (shift+insert -> cmd+v)',
      k.input('insert', ['shift']),
      k.outputKey('v', ['command']),
      k.frontmost_application_if(bundle.terminalEmulators)),
    
    // Application specific
    k.rule('[Finder] Open (enter)',
      k.input('return_or_enter'),
      k.outputKey('o', ['right_command']),
      k.frontmost_application_if(['^com\\.apple\\.finder$', '^com\\.binarynights\\.ForkLift\\-3$'])),
    k.rule('[Finder] Rename (F2)', // Not working
      k.input('F2'),
      k.outputKey('return_or_enter'),
      k.frontmost_application_if(['^com\\.apple\\.finder$', '^com\\.binarynights\\.ForkLift\\-3$'])),
    k.rule('[Finder] Delete (del)',
      k.input('delete_forward'),
      k.outputKey('delete_or_backspace', ['command']),
      k.frontmost_application_if(['^com\\.apple\\.finder$', '^com\\.binarynights\\.ForkLift\\-3$'])),
    k.rule('[Finder] Go back (backspace)',
      k.input('delete_or_backspace'),
      k.outputKey('up_arrow', ['command']),
      k.frontmost_application_if(['^com\\.apple\\.finder$', '^com\\.binarynights\\.ForkLift\\-3$'])),
    

    // See if these work as-is or need to be modified
    /*
    k.rule('Enter (Ctrl)',
           k.input('return_or_enter', ['control']),
           k.outputKey('return_or_enter', ['command']),
           k.condition('unless', bundle.standard, file_paths.standard)),
    k.rule('Enter (Ctrl+Shift)',
           k.input('return_or_enter', ['control', 'shift']),
           k.outputKey('return_or_enter', ['command', 'shift']),
           k.condition('unless', bundle.standard, file_paths.standard)),
    */
  ],
}

// Entry point for the build script in your package.json
import './controllers';

import { Turbo } from '@hotwired/turbo-rails';

// The below seems to only disable turbo for links...
// Turbo.session.drive = false;

import "../plugins/flatpickr"

import { loadDynamicHomeText } from '../components/typed';
import { fetchMap } from '../components/map';
import { activitiesCollapse } from '../components/init_activities';
import "bootstrap";


loadDynamicHomeText();
fetchMap();
activitiesCollapse();


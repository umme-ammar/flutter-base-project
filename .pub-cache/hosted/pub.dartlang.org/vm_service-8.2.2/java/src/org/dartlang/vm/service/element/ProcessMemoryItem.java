/*
 * Copyright (c) 2015, the Dart project authors.
 *
 * Licensed under the Eclipse Public License v1.0 (the "License"); you may not use this file except
 * in compliance with the License. You may obtain a copy of the License at
 *
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Unless required by applicable law or agreed to in writing, software distributed under the License
 * is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
 * or implied. See the License for the specific language governing permissions and limitations under
 * the License.
 */
package org.dartlang.vm.service.element;

// This is a generated file.

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

@SuppressWarnings({"WeakerAccess", "unused"})
public class ProcessMemoryItem extends Element {

  public ProcessMemoryItem(JsonObject json) {
    super(json);
  }

  /**
   * Subdivisons of this bucket of memory.
   */
  public ElementList<ProcessMemoryItem> getChildren() {
    return new ElementList<ProcessMemoryItem>(json.get("children").getAsJsonArray()) {
      @Override
      protected ProcessMemoryItem basicGet(JsonArray array, int index) {
        return new ProcessMemoryItem(array.get(index).getAsJsonObject());
      }
    };
  }

  /**
   * A longer description for this item.
   */
  public String getDescription() {
    return getAsString("description");
  }

  /**
   * A short name for this bucket of memory.
   */
  public String getName() {
    return getAsString("name");
  }

  /**
   * The amount of memory in bytes. This is a retained size, not a shallow size. That is, it
   * includes the size of children.
   */
  public int getSize() {
    return getAsInt("size");
  }
}
